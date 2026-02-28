import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minimalist_shopping_list/app/navigation/route_names.dart';

class HomeShellPage extends StatefulWidget {
  final Widget child;

  const HomeShellPage({super.key, required this.child});

  @override
  State<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends State<HomeShellPage> {
  int index = 0;

  final tabs = [
    Routes.lists,
    Routes.products,
    Routes.categories,
    Routes.settings,
  ];

  void onTab(int index) {
    setState(() {
      this.index = index;
    });
    context.go(tabs[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: onTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Listas'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Produtos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
