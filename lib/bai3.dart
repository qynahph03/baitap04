import 'package:flutter/material.dart';

void main() {
  runApp(MyShopApp());
}

class MyShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bai3',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
        fontFamily: 'Lato',
      ),
      home: ProductListScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      },
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'title': 'Màn hình Lenovo',
      'imagePath': 'assets/images/monitor1.png',
    },
    {
      'title': 'Màn hình Lenovo Oled',
      'imagePath': 'assets/images/monitor2.png',
    },
    {
      'title': 'Màn hình ViewSonic',
      'imagePath': 'assets/images/monitor3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('QTech',
        style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Text(
                'MyShop Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: products[index],
            );
          },
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(
                products[index]['title']!,
                textAlign: TextAlign.center,
              ),
              leading: IconButton(
                icon: Icon(Icons.favorite, color: Colors.purple),
                onPressed: () {},
              ),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.purple),
                onPressed: () {},
              ),
            ),
            child: Image.asset(
              products[index]['imagePath']!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final Map<String, String> product =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']!),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              product['imagePath']!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            product['title']!,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'QTech là Website bán màn hình máy tính tốt nhất mọi thời đại',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
