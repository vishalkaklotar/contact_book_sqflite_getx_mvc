import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../views/screens/contacts_screen.dart';
import '../../views/screens/search_screen.dart';
import 'route_name.dart';

final List<GetPage> getPages = [
  GetPage(name: contacts, page: () => ContactsScreen()),
  GetPage(name: search, page: () => const SearchScreen()),
];
