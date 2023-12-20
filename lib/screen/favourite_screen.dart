import 'package:bussines_card_maker/bloc/app_cubit.dart';
import 'package:bussines_card_maker/models/temp_model.dart';
import 'package:bussines_card_maker/screen/temp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  List<Template> templateData = TemplateModel.getTemplate();

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    return Scaffold(
      body: Column(
        children: appCubit.favList.map((item) {
          return Expanded(
            child: ListView.builder(
              itemCount: appCubit.favList.length,
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
                              image: AssetImage(templateData[item].imgPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              templateData[item].tempName,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<AppCubit>().addToFav(item);
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
          );
        }).toList(),
      ),

      // Column(
      //   children: context.read<AppCubit>().favList.map((item) {
      //     return ListTile(
      //       title: Text(item.tempName),
      //     );
      //   }).toList(),
      // ),
      // Column(
      //   children: context.read<AppCubit>().favList.map((item) {
      //     return ListView(
      //       children: [
      //         GestureDetector(
      //           onTap: () {
      //             final route = MaterialPageRoute(
      //               builder: (context) => const TempScreen(),
      //             );

      //             Navigator.push(context, route);
      //           },
      //           child: Padding(
      //             padding:
      //                 const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Container(
      //                   height: 250,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(30),
      //                     image: DecorationImage(
      //                       image: AssetImage(item.imgPath),
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                 ),
      //                 const SizedBox(height: 10),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(
      //                       item.tempName,
      //                       style: const TextStyle(
      //                         fontSize: 20,
      //                       ),
      //                     ),
      //                     IconButton(
      //                       onPressed: () {
      //                         // setState(() {
      //                         //   templateData[index].addToFavourite =
      //                         //       !templateData[index].addToFavourite;
      //                         // });
      //                       },
      //                       icon: item.addToFavourite
      //                           ? const Icon(Icons.favorite, color: Colors.red)
      //                           : const Icon(Icons.favorite_border),
      //                     ),
      //                   ],
      //                 ),
      //                 const SizedBox(height: 25),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     );
      //   }).toList(),
      // ),
    );
  }
}
