import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';

class CloudinaryService {
  Future<String> uploadFileToCloudinary(File? file) async {
    final cloudinary =
        CloudinaryPublic('dbhsvbsjj', 'ml_default', cache: false);
    CloudinaryResponse response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(file!.path,
          resourceType: CloudinaryResourceType.Image),
    );
    return response.secureUrl;
  }
}
