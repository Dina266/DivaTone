import 'dart:developer';
import 'dart:io';

import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../view_model/model/get_user.dart';

class CustomCircleAvatar extends StatefulWidget {
  const CustomCircleAvatar({super.key, required this.userModelEntity});
  final UserModelEntity userModelEntity;
  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  late String imageUrl;
  @override
  void initState() {
    super.initState();
    imageUrl = widget.userModelEntity.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: imageUrl.startsWith('http')
                  ? NetworkImage(imageUrl) 
                  : FileImage(File(imageUrl))
                      as ImageProvider, 
            ),
            shape: BoxShape.circle),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 40,
            height: 40,
            transform: Matrix4.translationValues(10, 10, 0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.isDarkMode
                  ? AppColors.darkGrey
                  : const Color(0xffE6E6E6),
            ),
            child: IconButton(
              onPressed: () => showImagePicker(context),
              icon: Icon(
                Icons.edit,
                color: context.isDarkMode
                    ? const Color(0xff959595)
                    : const Color(0xff555555),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () async {
                  Navigator.pop(context); // Close the bottom sheet
                  String newImage = await pickedImage(ImageSource.camera);
                  if (newImage != 'No image selected.') {
                    setState(() {
                      imageUrl = newImage; 
                    });
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.photo),
                onPressed: () async {
                  Navigator.pop(context); 
                  String newImage = await pickedImage(ImageSource.gallery);
                  if (newImage != 'No image selected.') {
                    setState(() {
                      imageUrl = newImage; 
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

  Future<String> pickedImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      log('Image Path: ${image.path}');
      return image.path; // Return the path of the picked image
    } else {
      log('No image selected.');
      return 'No image selected.'; // Handle no image selected case
    }
  }
}
