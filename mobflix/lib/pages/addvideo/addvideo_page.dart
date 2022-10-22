import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobflix/controllers/video_controller.dart';
import 'package:mobflix/models/category_model.dart';
import 'package:mobflix/models/video_model.dart';
import 'package:mobflix/pages/addvideo/widgets/preview_video.dart';
import 'package:mobflix/pages/addvideo/widgets/title_addvideo.dart';
import 'package:mobflix/utils/color.dart';
import 'package:provider/provider.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  final formKey = GlobalKey<FormState>();

  Category? category;
  String? url;

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<VideoController>().getCategories();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleAddVideo(),
                  const SizedBox(height: 35),
                  const Text(
                    'URL:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        fillColor: MobflixColors.blue,
                        filled: true,
                        hintText: 'Ex: N3h5A0oAzsk',
                        hintStyle: const TextStyle(
                          color: MobflixColors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Digite uma Url';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          url = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    'Categoria',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: DropdownButtonFormField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      dropdownColor: Colors.black,
                      decoration: InputDecoration(
                        fillColor: MobflixColors.blue,
                        filled: true,
                        hintText: 'Categorias...',
                        hintStyle: const TextStyle(
                          color: MobflixColors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: categories
                          .map(
                            (e) => DropdownMenuItem<Category>(
                              value: e,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          category = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Selecione uma categoria';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  PreviewVideo(
                    url: url,
                    category: category,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        final validate =
                            formKey.currentState?.validate() ?? false;
                        if (validate) {
                          final video = Video(
                            url: 'https://www.youtube.com/watch?v=$url',
                            category: category!,
                            showInBanner: false,
                          );
                          context.read<VideoController>().addVideo(video);
                          Navigator.of(context).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MobflixColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Cadastrar',
                        style: GoogleFonts.roboto(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
