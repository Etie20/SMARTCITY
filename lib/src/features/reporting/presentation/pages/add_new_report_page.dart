import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:smart_city/src/core/common/widgets/loader.dart';
import 'package:smart_city/src/core/theme/app_pallete.dart';
import 'package:smart_city/src/core/utils/pick_image.dart';
import 'package:smart_city/src/core/utils/show_snackbar.dart';
import 'package:smart_city/src/features/reporting/presentation/bloc/report_bloc.dart';
import 'package:smart_city/src/features/reporting/presentation/pages/report_page.dart';
import 'package:smart_city/src/features/reporting/presentation/widgets/report_editor.dart';

class AddNewReportPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddNewReportPage());
  const AddNewReportPage({super.key});

  @override
  State<AddNewReportPage> createState() => _AddNewReportPageState();
}

class _AddNewReportPageState extends State<AddNewReportPage> {
  final descriptionController = TextEditingController();
  File? image;
  LatLng? selectedPosition;
  final formKey = GlobalKey<FormState>();

  void selectImage() async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Prendre une photo'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage = await pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    setState(() {
                      image = pickedImage;
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Depuis la galerie'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage = await pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      image = pickedImage;
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }


  void uploadBlog() async {
    if (formKey.currentState!.validate() && image != null) {
      // final posterId =
      //     (context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;
      context.read<ReportBloc>().add(
            ReportUpload(
              description: descriptionController.text.trim(),
              image: image!,
              categoryId: '90660e3a-c93b-4ffb-b7ec-d8f78ab6acb0',
              statusId: 'c27f17cc-8aaf-44d3-863a-545e28144b96',
            ),
          );
    }
  }

  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signaler un problème'),
        actions: [
          IconButton(
            onPressed: () {
              uploadBlog();
            },
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: BlocConsumer<ReportBloc, ReportState>(
        listener: (context, state) {
          if (state is ReportFailure) {
            showSnackBar(context, state.message);
          } else if (state is ReportUploadSuccess) {
            Navigator.pushAndRemoveUntil(
                context, ReportPage.route(), (route) => false);
          }
        },
        builder: (context, state) {
          if (state is ReportLoading) {
            return const Loader();
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Photo du problème", style: TextStyle(fontSize: 15),),
                      const SizedBox(
                        height: 10,
                      ),
                      image != null
                          ? GestureDetector(
                              onTap: () {
                                selectImage();
                              },
                              child: SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child:
                                        Image.file(image!, fit: BoxFit.cover)),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                selectImage();
                              },
                              child: DottedBorder(
                                color: AppPallete.borderColor,
                                dashPattern: const [10, 4],
                                radius: const Radius.circular(10),
                                borderType: BorderType.RRect,
                                strokeCap: StrokeCap.round,
                                child: const SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.folder_open,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                        'Take a photo or import',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: Constants.topics
                      //         .map(
                      //           (e) => Padding(
                      //         padding: const EdgeInsets.all(5.0),
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             if (selectedTopics.contains(e)) {
                      //               selectedTopics.remove(e);
                      //             } else {
                      //               selectedTopics.add(e);
                      //             }
                      //
                      //             setState(() {});
                      //           },
                      //           child: Chip(
                      //             label: Text(e),
                      //             color: selectedTopics.contains(e)
                      //                 ? const MaterialStatePropertyAll(
                      //                 AppPallete.gradient1)
                      //                 : null,
                      //             side: selectedTopics.contains(e)
                      //                 ? null
                      //                 : const BorderSide(
                      //               color: AppPallete.borderColor,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //         .toList(),
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      const Text("Description", style: TextStyle(fontSize: 15),),
                      const SizedBox(
                        height: 10,
                      ),
                      ReportEditor(
                          controller: descriptionController,
                          hintText: 'Report Description'),
                      const SizedBox(height: 20),
                      const Text("Localisation", style: TextStyle(fontSize: 15),),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppPallete.borderColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: const LatLng(3.9700324245470235, 9.792637712065938), // Abidjan par défaut
                            onTap: (tapPosition, point) {
                              setState(() {
                                selectedPosition = point;
                              });
                            },
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                              subdomains: const ['a', 'b', 'c'],
                              userAgentPackageName: 'com.example.smartcity',
                            ),
                            if (selectedPosition != null)
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    point: selectedPosition!,
                                    width: 40,
                                    height: 40,
                                    child: const Icon(
                                      Icons.location_pin,
                                      size: 40,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      // const SizedBox(height: 20),
                      // BlogEditor(
                      //   controller: contentController,
                      //   hintText: 'Blog Content',
                      // ),
                      // const SizedBox(height: 20),
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: TextButton(
                      //     onPressed: () {
                      //       Navigator.push(context, MarkdownEditPage.route(contentController));
                      //     },
                      //     child: const Text(
                      //       'Markdown Editor',
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
