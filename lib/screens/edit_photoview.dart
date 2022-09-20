import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_photo_editor_flutter_app/getx_controllers/edit_photoview_get_controller.dart';
import 'package:new_photo_editor_flutter_app/screens/chip_widget.dart';

class EditPhotoView extends StatefulWidget {
  const EditPhotoView({Key? key}) : super(key: key);

  @override
  State<EditPhotoView> createState() => _EditPhotoViewState();
}

class _EditPhotoViewState extends State<EditPhotoView> {
  EditPhotoViewGetController editPhotoViewGetController =
      Get.put(EditPhotoViewGetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        centerTitle: false,
        title: Text(
          'Adjust',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check_box),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/pixel.png"),
                    )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.cyan.shade100,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Contrast',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                  height: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepPurple.shade200,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Obx(() {
                                      return Text(
                                        editPhotoViewGetController
                                            .sliderValue.value
                                            .toStringAsFixed(2),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 20,
                ),
                Spacer(flex: 1),
                ChipWidget(
                    label: Icon(Icons.brightness_4), horizontalPadding: 8),
                SizedBox(
                  width: 16,
                ),
                ChipWidget(
                    label: Icon(Icons.water_drop_outlined),
                    horizontalPadding: 8),
                SizedBox(
                  width: 16,
                ),
                ChipWidget(label: Icon(Icons.contrast), horizontalPadding: 8),
                SizedBox(
                  width: 16,
                ),
                ChipWidget(
                    label: Icon(Icons.settings_brightness_rounded),
                    horizontalPadding: 8),
                SizedBox(
                  width: 16,
                ),
                ChipWidget(label: Icon(Icons.settings), horizontalPadding: 8),
                SizedBox(
                  width: 16,
                ),
                ChipWidget(
                  label: Icon(Icons.brightness_high_outlined),
                ),
                SizedBox(
                  width: 28,
                )
              ],
            )),
            Obx(() {
              return Slider(
                value: editPhotoViewGetController.sliderValue.value,
                onChanged: (value) {
                  editPhotoViewGetController.sliderValue.value = value;
                },
              );
            }),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
