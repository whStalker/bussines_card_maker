import 'package:bussines_card_maker/bloc/app_cubit.dart';
import 'package:flutter/material.dart';

import 'package:bussines_card_maker/models/temp_model.dart';
import 'package:bussines_card_maker/screen/temp_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemplateListScreen extends StatefulWidget {
  const TemplateListScreen({super.key});

  @override
  State<TemplateListScreen> createState() => _TemplateListScreenState();
}

class _TemplateListScreenState extends State<TemplateListScreen> {
  List<Template> templateData = TemplateModel.getTemplate();

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template List'),
      ),
      body: Scaffold(
        body: ListView.builder(
          itemCount: templateData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => const TempScreen(),
                );

                Navigator.push(context, route);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(templateData[index].imgPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          templateData[index].tempName,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<AppCubit>().addToFav(index);
                          },
                          icon: const Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
