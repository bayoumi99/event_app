import 'package:event_app/fireBase/fireBase_auth_servces.dart';
import 'package:event_app/models/Category_Dm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/Theme/app_Color.dart';
import '../../../core/provider/app_config_provider.dart';

class HomeHeader extends StatelessWidget {
  final List<CategoryDm> categoriesList;
  final CategoryDm selectedCategory;
  final Function(CategoryDm) changeSelectedCategory;


  const HomeHeader({super.key, required this.categoriesList, required this.selectedCategory, required this.changeSelectedCategory});

  @override
  Widget build(BuildContext context) {
    var provider =  Provider.of<AppConfigProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: provider.isDark()?AppColor.darkPurple:AppColor.purple,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24 ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: provider.isDark()?AppColor.lightBlue:AppColor.white,
                ),),
                Text(FirebaseAuthServces().getUserData()?.displayName??"" , style:
                Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: provider.isDark()?AppColor.lightBlue:AppColor.white,
                ),)
              ],
                        ),
                      ),
                      IconButton(
              onPressed: (){
                provider.changeTheme(provider.isDark()?ThemeMode.light:ThemeMode.dark);
              }, icon: Icon(provider.isDark()?Icons.dark_mode_outlined:
                      Icons.light_mode_outlined,
                        color: provider.isDark()?AppColor.lightBlue:
                        AppColor.white,
                      )),
                      InkWell(
                        onTap: (){
              provider.changeLocal(provider.isEn()?"ar":"en");
                        },
                        child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: provider.isDark()?AppColor.lightBlue:AppColor.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(provider.isEn()?"EN": "ع",
                style: TextStyle(
                  color: provider.isDark()?AppColor.darkPurple
                      :AppColor.purple,
                ),),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                      children: [
                        Icon(Icons.location_on_outlined,
              color: provider.isDark()?AppColor.lightBlue:AppColor.white,
                        ),
                        SizedBox(width: 8,),
                        Text("El-Minya, Egypt",style:
                        Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: provider.isDark()?AppColor.lightBlue:AppColor.white,)),

                      ]
                  ),
                  SizedBox(height: 16,),
                ],
              ),
            ),
            DefaultTabController(
              length: categoriesList.length,
              child: TabBar(
                isScrollable: true,
                indicator:null ,
                indicatorColor: Colors.transparent,
                dividerHeight: 0,
                labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 8),
                tabAlignment: TabAlignment.start,
                tabs:
                categoriesList.map((category)=> Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: category.id== selectedCategory.id?AppColor.white:Colors.transparent,
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(width: 1,
                            color: provider.isDark()?AppColor.lightBlue:AppColor.white)
                      ),
                     child: Row(
                  children: [
                    Icon(category.icon ,
                      color: category.id== selectedCategory.id?Theme.of(context).primaryColor:AppColor.white,
                    ),
                    SizedBox(height: 8,),
                    Text(provider.isEn()?category.nameEn:category.nameAr,
                    style: TextStyle(
                      color: category.id== selectedCategory.id?Theme.of(context).primaryColor:AppColor.white,
                    ),)
                     ],
                )
               )
    ).toList(),
            )


            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
