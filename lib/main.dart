import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AfroFashionApp());
}

class AfroFashionApp extends StatelessWidget {
  const AfroFashionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AfroFashion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFD35400), // Deep Earthy Orange
        scaffoldBackgroundColor: const Color(0xFFF8F9F9),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF1A5276), // Ocean Blue
          primary: const Color(0xFFD35400),
        ),
        fontFamily: 'Poppins',
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF17202A),
          elevation: 1,
        ),
      ),
      home: const CustomerHomeScreen(),
    );
  }
}

// -------------------- Models --------------------

class Product {
  final int id;
  final String name;
  final double price;
  final String category;
  final String image;
  final String region;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
    required this.region,
  });
}

// -------------------- Data --------------------

final List<Product> products = [
  Product(id: 1, name: "Maxhosa Knit Cardigan", price: 4500, category: "men", region: "South Africa", image: "https://images.unsplash.com/photo-1617137968427-85924c809a10?auto=format&fit=crop&w=600&q=80"),
  Product(id: 2, name: "Ankara Mermaid Dress", price: 2800, category: "women", region: "Nigeria", image: "https://images.unsplash.com/photo-1596701062351-87a1a457c156?auto=format&fit=crop&w=600&q=80"),
  Product(id: 3, name: "Kente Silk Scarf", price: 850, category: "accessories", region: "Ghana", image: "https://images.unsplash.com/photo-1606760227091-3dd870d97f1d?auto=format&fit=crop&w=600&q=80"),
  Product(id: 4, name: "Modern Agbada Set", price: 5200, category: "men", region: "Nigeria", image: "https://images.unsplash.com/photo-1542596768-5d1d21f1cf3d?auto=format&fit=crop&w=600&q=80"),
  Product(id: 5, name: "Maasai Beaded Necklace", price: 1200, category: "accessories", region: "Kenya", image: "https://images.unsplash.com/photo-1620138546344-7b623bc99026?auto=format&fit=crop&w=600&q=80"),
  Product(id: 6, name: "Shweshwe Summer Dress", price: 1500, category: "women", region: "South Africa", image: "https://images.unsplash.com/photo-1589156229687-496a31ad1d1f?auto=format&fit=crop&w=600&q=80"),
  Product(id: 7, name: "Senegalese Boubou", price: 3200, category: "men", region: "Senegal", image: "https://images.unsplash.com/photo-1534030347209-7147fd69a394?auto=format&fit=crop&w=600&q=80"),
  Product(id: 8, name: "Ethiopian Habesha Kemis", price: 2600, category: "women", region: "Ethiopia", image: "https://images.unsplash.com/photo-1566206091558-19913506385d?auto=format&fit=crop&w=600&q=80"),
  Product(id: 9, name: "Kitenge Bomber Jacket", price: 1800, category: "men", region: "Tanzania", image: "https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?auto=format&fit=crop&w=600&q=80"),
  Product(id: 10, name: "Zulu Isicholo Hat", price: 650, category: "accessories", region: "South Africa", image: "https://images.unsplash.com/photo-1596701062351-87a1a457c156?auto=format&fit=crop&w=600&q=80"),
  Product(id: 11, name: "Kente Tote Bag", price: 950, category: "accessories", region: "Ghana", image: "https://images.unsplash.com/photo-1590874102752-ce22d84d996f?auto=format&fit=crop&w=600&q=80"),
  Product(id: 12, name: "Mud Cloth Hoodie", price: 1100, category: "men", region: "Mali", image: "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&w=600&q=80"),
  Product(id: 13, name: "Ndebele Choker", price: 450, category: "accessories", region: "Zimbabwe", image: "https://images.unsplash.com/photo-1576185850227-1f72b7f8d483?auto=format&fit=crop&w=600&q=80"),
  Product(id: 14, name: "Dashiki Shirt", price: 850, category: "men", region: "Nigeria", image: "https://images.unsplash.com/photo-1523381210434-271e8be1f52b?auto=format&fit=crop&w=600&q=80"),
  Product(id: 15, name: "Swahili Maxi Dress", price: 1950, category: "women", region: "Tanzania", image: "https://images.unsplash.com/photo-1496747611176-843222e1e57c?auto=format&fit=crop&w=600&q=80"),
];

// -------------------- Screens --------------------

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final List<Product> _cart = [];
  String _selectedCategory = 'All';

  void _addToCart(Product product) {
    setState(() {
      _cart.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product.name} added to cart!'), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _selectedCategory == 'All'
        ? products
        : products.where((p) => p.category.toLowerCase() == _selectedCategory.toLowerCase()).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('🌍 AfroFashion', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => CartScreen(cart: _cart)));
                },
              ),
              if (_cart.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: Color(0xFFD35400), shape: BoxShape.circle),
                    child: Text('${_cart.length}', style: const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                )
            ],
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Banner Sliver
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1548171915-e79a380a2a4b?auto=format&fit=crop&w=800&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.4),
                alignment: Alignment.center,
                child: const Text(
                  'Wear the Spirit of Africa',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          
          // Filters Sliver
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: ['All', 'Men', 'Women', 'Accessories'].map((cat) {
                  final isSelected = _selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: const Color(0xFF17202A),
                      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedCategory = cat;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Product Grid Sliver (Cards)
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(
                    product: product, 
                    onAdd: () => _addToCart(product),
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (c) => ProductDetailsScreen(product: product, onAdd: () => _addToCart(product)))
                      );
                    },
                  );
                },
                childCount: filteredProducts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onAdd, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                errorBuilder: (c, o, s) => Container(color: Colors.grey[200], child: const Icon(Icons.broken_image)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.region} • ${product.category.toUpperCase()}',
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'R${product.price.toStringAsFixed(0)}',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD35400)),
                    ),
                    InkWell(
                      onTap: onAdd,
                      child: const Icon(Icons.add_circle, color: Color(0xFFD35400)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const ProductDetailsScreen({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(product.image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A5276).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          product.region,
                          style: const TextStyle(color: Color(0xFF1A5276), fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'R${product.price.toStringAsFixed(0)}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFD35400)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Category: ${product.category.toUpperCase()}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This authentic African piece is handcrafted using traditional techniques passed down through generations. Each stitch tells a story of heritage and culture.',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: ElevatedButton(
          onPressed: () {
            onAdd();
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD35400),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Add to Cart', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final List<Product> cart;

  const CartScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    double total = cart.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: cart.isEmpty
          ? const Center(child: Text('Your cart is empty!'))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(item.image, width: 50, height: 50, fit: BoxFit.cover),
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.region),
                  trailing: Text('R${item.price.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Total:', style: TextStyle(color: Colors.grey)),
                Text('R${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Checkout Logic
                showDialog(
                  context: context, 
                  builder: (c) => AlertDialog(
                    title: const Text('Checkout'),
                    content: const Text('PayFast & Yoco Integration coming soon!'),
                    actions: [TextButton(onPressed: () => Navigator.pop(c), child: const Text('Close'))],
                  )
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD35400),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text('Checkout'),
            )
          ],
        ),
      ),
    );
  }
}
