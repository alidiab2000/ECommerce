import 'package:e_commerce/Feature/shop/models/banner_model/banner_model.dart';
import 'package:e_commerce/Feature/shop/models/category_model/category_model.dart';
import 'package:e_commerce/core/utils/common/routes/app_router.dart';
import 'package:e_commerce/core/utils/constants/image_strings.dart';

class DummyData {
  static List<CategoryModel> categories = [
    // Featured
    CategoryModel(
        id: "1", name: "Sports", image: AppImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: "2",
        name: "Furniture",
        image: AppImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: "3",
        name: "Electronics",
        image: AppImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: "4", name: "Clothes", image: AppImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: "6", name: "Animal", image: AppImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: "7", name: "Shoes", image: AppImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: "14",
        name: "Cosmetics",
        image: AppImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: "5",
        name: "Jewelery",
        image: AppImages.jeweleryIcon,
        isFeatured: true), //===
//SupCategories
    //Sports
    CategoryModel(
        id: "8",
        name: "Sport Shose",
        image: AppImages.sportIcon,
        parentId: "1",
        isFeatured: false),
    CategoryModel(
        id: "9",
        name: "Track suita",
        image: AppImages.sportIcon,
        parentId: "1",
        isFeatured: false),
    CategoryModel(
        id: "10",
        name: "Sports Equipment",
        image: AppImages.sportIcon,
        parentId: "1",
        isFeatured: false),

    //Furniture
    CategoryModel(
        id: "11",
        name: "Bedroom Furniture",
        image: AppImages.furnitureIcon,
        parentId: "2",
        isFeatured: false),
    CategoryModel(
        id: "12",
        name: "Ketchen Furniture",
        image: AppImages.furnitureIcon,
        parentId: "2",
        isFeatured: false),
    CategoryModel(
        id: "13",
        name: "Office Furniture",
        image: AppImages.furnitureIcon,
        parentId: "2",
        isFeatured: false),
//Electronics
    CategoryModel(
        id: "14",
        name: "Laptop",
        image: AppImages.electronicsIcon,
        parentId: "3",
        isFeatured: false),
    CategoryModel(
        id: "15",
        name: "Mobile",
        image: AppImages.electronicsIcon,
        parentId: "3",
        isFeatured: false),

    //Clothes
    CategoryModel(
        id: "16",
        name: "T-Shirt",
        image: AppImages.clothIcon,
        parentId: "4",
        isFeatured: false),
    CategoryModel(
        id: "17",
        name: "Jacket",
        image: AppImages.clothIcon,
        parentId: "4",
        isFeatured: false),
    CategoryModel(
        id: "18",
        name: "Pants",
        image: AppImages.clothIcon,
        parentId: "4",
        isFeatured: false),
  ];

  static List<BannerModel> banners = [
    BannerModel(
      imageURL: AppImages.banner1,
      targetScreen: AppRoute.orderViewPath,
      active: true,
    ),
    BannerModel(
      imageURL: AppImages.banner2,
      targetScreen: AppRoute.cartviewPath,
      active: true,
    ),
    BannerModel(
      imageURL: AppImages.banner3,
      targetScreen: AppRoute.wishListViewPath,
      active: true,
    ),

    //TODO : Add Search Screem
    // BannerModel(
    //   imageURL: AppImages.banner4,
    //   targetScreen: AppRoute.,
    //   active: true,
    // ),
    BannerModel(
      imageURL: AppImages.banner5,
      targetScreen: AppRoute.settingViewPath,
      active: true,
    ),
    BannerModel(
      imageURL: AppImages.banner6,
      targetScreen: AppRoute.addressViewPath,
      active: true,
    ),

    BannerModel(
      imageURL: AppImages.banner8,
      targetScreen: AppRoute.chekoutViewPath,
      active: true,
    ),
  ];
}
