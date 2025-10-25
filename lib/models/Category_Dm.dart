import 'package:flutter/material.dart';

class CategoryDm {
  String nameEn;
  String nameAr;
  int id;
  String imagePath;
  IconData icon;

  CategoryDm(this.nameEn, this.nameAr, this.id, this.imagePath, this.icon);
}


List<CategoryDm> categoriesList = [
  CategoryDm(
    'Sport',
    'رياضة',
    1,
    'assets/image/Sport.png',
    Icons.sports_soccer,
  ),
  CategoryDm(
    'Birthday',
    'عيد ميلاد',
    2,
    'assets/image/birthday.png',
    Icons.cake,
  ),
  CategoryDm(
    'Meeting',
    'اجتماع',
    3,
    'assets/image/meeting.png',
    Icons.people_alt,
  ),
  CategoryDm(
    'Gaming',
    'ألعاب',
    4,
    'assets/image/gaming.png',
    Icons.videogame_asset,
  ),
  CategoryDm(
    'Eating',
    'تناول الطعام',
    5,
    'assets/image/eating.png',
    Icons.restaurant,
  ),
  CategoryDm(
    'Holiday',
    'عطلة',
    6,
    'assets/image/holiday.png',
    Icons.beach_access,
  ),
  CategoryDm(
    'Exhibition',
    'معرض',
    7,
    'assets/image/exhibition.png',
    Icons.brush,
  ),
  CategoryDm(
    'Workshop',
    'ورشة عمل',
    8,
    'assets/image/workshop.png',
    Icons.build,
  ),
  CategoryDm(
    'Book Club',
    'نادي الكتاب',
    9,
    'assets/image/book_club.png',
    Icons.menu_book,
  ),
];