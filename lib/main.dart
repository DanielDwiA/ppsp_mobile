import 'package:flutter/material.dart';

// ==========================================
// 1. MODEL DATA
// ==========================================

// Model Customer
class Customer {
  String id;
  String name;
  String address;
  String dob;
  String phone;
  String memberStatus;

  Customer({
    required this.id,
    required this.name,
    required this.address,
    required this.dob,
    required this.phone,
    required this.memberStatus,
  });
}

// Model Animal
class Animal {
  String id;
  String customerId;
  String name;
  String dob;
  String species;

  Animal({
    required this.id,
    required this.customerId,
    required this.name,
    required this.dob,
    required this.species,
  });
}

// Model Produk & Layanan
class ProductService {
  String id;
  String name;
  String category; // Barang atau Jasa
  double price;
  String description;

  ProductService({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
  });
}

// ==========================================
// 2. MAIN APP & THEME
// ==========================================

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Shop Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 2),
      ),
      home: const LoginScreen(),
    );
  }
}

// ==========================================
// 3. LOGIN SCREEN
// ==========================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginCS() {
    if (_usernameController.text == 'cs' && _passwordController.text == '123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminMainScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Gagal! Username: cs, Pass: 123'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _enterAsGuest() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PublicMainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.pets, size: 80, color: Colors.teal),
                  const SizedBox(height: 16),
                  const Text(
                    'Pet Shop Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username (CS)',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _loginCS,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Masuk sebagai CS'),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: _enterAsGuest,
                    child: const Text('Lihat Produk & Layanan (Tamu)'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 4. PUBLIC AREA (Produk, Layanan, Profil)
// ==========================================

class PublicMainScreen extends StatefulWidget {
  const PublicMainScreen({super.key});

  @override
  State<PublicMainScreen> createState() => _PublicMainScreenState();
}

class _PublicMainScreenState extends State<PublicMainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const ProductCatalogPage(),
    const ShopProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Produk & Layanan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Profil Toko'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

class ProductCatalogPage extends StatefulWidget {
  const ProductCatalogPage({super.key});

  @override
  State<ProductCatalogPage> createState() => _ProductCatalogPageState();
}

class _ProductCatalogPageState extends State<ProductCatalogPage> {
  // Dummy Data Produk
  List<ProductService> products = [
    ProductService(
      id: '1',
      name: 'Makanan Kucing Premium',
      category: 'Barang',
      price: 150000,
      description: 'Makanan kering 2kg',
    ),
    ProductService(
      id: '2',
      name: 'Grooming Kucing Lengkap',
      category: 'Layanan',
      price: 75000,
      description: 'Mandi, potong kuku, bersihkan telinga',
    ),
    ProductService(
      id: '3',
      name: 'Vitamin Bulu',
      category: 'Barang',
      price: 45000,
      description: 'Untuk bulu lebat dan berkilau',
    ),
    ProductService(
      id: '4',
      name: 'Penitipan Hewan (Per Hari)',
      category: 'Layanan',
      price: 50000,
      description: 'Termasuk makan dan main',
    ),
    ProductService(
      id: '5',
      name: 'Kalung Anti Kutu',
      category: 'Barang',
      price: 30000,
      description: 'Efektif selama 3 bulan',
    ),
  ];

  List<ProductService> displayedProducts = [];
  TextEditingController searchController =
      TextEditingController(); // Controller Search
  String _sortValue = 'name_asc'; // Default sort

  @override
  void initState() {
    super.initState();
    displayedProducts = List.from(products);
    _sortProducts(_sortValue);
  }

  // Logic Pencarian (Search)
  void _runFilter(String keyword) {
    List<ProductService> results = [];
    if (keyword.isEmpty) {
      results = List.from(products);
    } else {
      results = products
          .where(
            (item) =>
                item.name.toLowerCase().contains(keyword.toLowerCase()) ||
                item.category.toLowerCase().contains(keyword.toLowerCase()),
          )
          .toList();
    }

    setState(() {
      displayedProducts = results;
      // Re-apply sorting setelah filter
      _sortProducts(_sortValue, updateState: false);
    });
  }

  void _sortProducts(String sortType, {bool updateState = true}) {
    // Fungsi sorting
    void sortLogic() {
      _sortValue = sortType;
      if (sortType == 'price_asc') {
        displayedProducts.sort((a, b) => a.price.compareTo(b.price));
      } else if (sortType == 'price_desc') {
        displayedProducts.sort((a, b) => b.price.compareTo(a.price));
      } else if (sortType == 'name_asc') {
        displayedProducts.sort((a, b) => a.name.compareTo(b.name));
      }
    }

    if (updateState) {
      setState(() {
        sortLogic();
      });
    } else {
      sortLogic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Pet Shop'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: _sortProducts,
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'name_asc', child: Text('Nama (A-Z)')),
              const PopupMenuItem(
                value: 'price_asc',
                child: Text('Harga (Terendah)'),
              ),
              const PopupMenuItem(
                value: 'price_desc',
                child: Text('Harga (Tertinggi)'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // --- SEARCH BAR UTAMA ---
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                labelText: 'Cari Produk atau Layanan...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
          ),
          // --- LIST PRODUK ---
          Expanded(
            child: displayedProducts.isEmpty
                ? const Center(child: Text('Produk tidak ditemukan'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: displayedProducts.length,
                    itemBuilder: (context, index) {
                      final item = displayedProducts[index];
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: item.category == 'Layanan'
                                ? Colors.orange.shade100
                                : Colors.blue.shade100,
                            child: Icon(
                              item.category == 'Layanan'
                                  ? Icons.spa
                                  : Icons.shopping_bag,
                            ),
                          ),
                          title: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${item.category}\n${item.description}',
                          ),
                          isThreeLine: true,
                          trailing: Text(
                            'Rp${item.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          onTap: () {
                            // Hanya lihat saja (Read Only)
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(item.name),
                                content: Text(
                                  'Harga: Rp${item.price}\nKategori: ${item.category}\n\nDeskripsi:\n${item.description}',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Tutup'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class ShopProfilePage extends StatelessWidget {
  const ShopProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Pet Shop')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.teal.shade200,
              child: const Icon(
                Icons.storefront,
                size: 100,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Kouvee Petshop",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.teal),
                    title: Text("Alamat"),
                    subtitle: Text("Jl. Hewan Bahagia No. 10, Jakarta Selatan"),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.teal),
                    title: Text("Telepon"),
                    subtitle: Text("021-555-9999"),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time, color: Colors.teal),
                    title: Text("Jam Operasional"),
                    subtitle: Text("Senin - Minggu: 08.00 - 20.00"),
                  ),
                  Divider(),
                  Text(
                    "Tentang Kami",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Kami menyediakan segala kebutuhan hewan peliharaan Anda mulai dari makanan berkualitas, aksesoris lucu, hingga layanan grooming dan penitipan hewan profesional.",
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. ADMIN/CS AREA (CRUDS LOGIC)
// ==========================================

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [const CustomerPage(), const AnimalPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Kelola Customer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Kelola Hewan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

// --- HALAMAN CUSTOMER (Dengan Error Handling & Konfirmasi) ---

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  List<Customer> customers = [
    Customer(
      id: '1',
      name: 'Andi Pratama',
      address: 'Jl. Merpati No. 12',
      dob: '1998-05-21',
      phone: '081234567890',
      memberStatus: 'Gold',
    ),
    Customer(
      id: '2',
      name: 'Bunga Lestari',
      address: 'Jl. Melati No. 45',
      dob: '2000-09-15',
      phone: '081298765432',
      memberStatus: 'Silver',
    ),
    Customer(
      id: '3',
      name: 'Rizky Ramadhan',
      address: 'Jl. Diponegoro No. 10',
      dob: '1995-11-30',
      phone: '082134567891',
      memberStatus: 'Platinum',
    ),
    Customer(
      id: '4',
      name: 'Sinta Dewi',
      address: 'Jl. Kenanga No. 8',
      dob: '2001-02-10',
      phone: '083234567892',
      memberStatus: 'Regular',
    ),
    Customer(
      id: '5',
      name: 'Dewa Mahendra',
      address: 'Jl. Cendrawasih No. 3',
      dob: '1999-07-05',
      phone: '081345678993',
      memberStatus: 'Gold',
    ),
    Customer(
      id: '6',
      name: 'Aulia Rahman',
      address: 'Jl. Mawar No.12',
      dob: '1998-04-15',
      phone: '081234567890',
      memberStatus: 'Member',
    ),
    Customer(
      id: '7',
      name: 'Budi Santoso',
      address: 'Jl. Melati No.7',
      dob: '1995-11-21',
      phone: '082134567890',
      memberStatus: 'Non-Member',
    ),
  ];

  List<Customer> filteredCustomers = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCustomers = customers;
  }

  void _runFilter(String keyword) {
    List<Customer> results = [];
    if (keyword.isEmpty) {
      results = customers;
    } else {
      results = customers
          .where(
            (user) => user.name.toLowerCase().contains(keyword.toLowerCase()),
          )
          .toList();
    }
    setState(() {
      filteredCustomers = results;
    });
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  void _confirmDelete(String id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: const Text(
          'Apakah Anda yakin ingin menghapus data ini? Tindakan ini tidak dapat dibatalkan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                customers.removeWhere((item) => item.id == id);
                _runFilter(searchController.text);
              });
              Navigator.of(ctx).pop();
              _showSnackbar('Data berhasil dihapus', Colors.red);
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<bool> _confirmCancel() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Batalkan Perubahan?'),
            content: const Text('Data yang belum disimpan akan hilang.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Lanjut Mengedit'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Ya, Batalkan'),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _showFormDialog({Customer? customer}) {
    final nameController = TextEditingController(text: customer?.name ?? '');
    final addressController = TextEditingController(
      text: customer?.address ?? '',
    );
    final dobController = TextEditingController(text: customer?.dob ?? '');
    final phoneController = TextEditingController(text: customer?.phone ?? '');
    final statusController = TextEditingController(
      text: customer?.memberStatus ?? '',
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: _confirmCancel,
        child: AlertDialog(
          title: Text(customer == null ? 'Tambah Customer' : 'Edit Customer'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Alamat'),
                ),
                TextField(
                  controller: dobController,
                  decoration: const InputDecoration(
                    labelText: 'Tgl Lahir (YYYY-MM-DD)',
                  ),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'No. Telepon'),
                  keyboardType: TextInputType.phone,
                ),
                TextField(
                  controller: statusController,
                  decoration: const InputDecoration(labelText: 'Status Member'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (await _confirmCancel()) {
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                }
              },
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    phoneController.text.isEmpty) {
                  _showSnackbar(
                    'Nama dan No. Telp wajib diisi!',
                    Colors.orange,
                  );
                  return;
                }

                if (customer == null) {
                  final newCustomer = Customer(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: nameController.text,
                    address: addressController.text,
                    dob: dobController.text,
                    phone: phoneController.text,
                    memberStatus: statusController.text,
                  );
                  setState(() {
                    customers.add(newCustomer);
                    _runFilter(searchController.text);
                  });
                  _showSnackbar('Customer berhasil ditambahkan', Colors.green);
                } else {
                  setState(() {
                    customer.name = nameController.text;
                    customer.address = addressController.text;
                    customer.dob = dobController.text;
                    customer.phone = phoneController.text;
                    customer.memberStatus = statusController.text;
                    _runFilter(searchController.text);
                  });
                  _showSnackbar('Customer berhasil diperbarui', Colors.blue);
                }
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Customer (CS)'),
        backgroundColor: Colors.blue.shade100,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Cari Customer...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredCustomers.isEmpty
                ? const Center(child: Text('Tidak ada data'))
                : ListView.builder(
                    itemCount: filteredCustomers.length,
                    itemBuilder: (context, index) {
                      final item = filteredCustomers[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue.shade100,
                            child: Text(
                              item.name.isNotEmpty ? item.name[0] : '?',
                            ),
                          ),
                          title: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status: ${item.memberStatus} | Tgl: ${item.dob}',
                              ),
                              Text('${item.phone}'),
                              Text(
                                item.address,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          isThreeLine: true,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                                onPressed: () =>
                                    _showFormDialog(customer: item),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () => _confirmDelete(item.id),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFormDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// --- HALAMAN HEWAN (Dengan Error Handling & Konfirmasi) ---

class AnimalPage extends StatefulWidget {
  const AnimalPage({super.key});

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  List<Animal> animals = [
    Animal(
      id: '1',
      customerId: '1',
      name: 'Bobby',
      dob: '2020-03-12',
      species: 'Anjing',
    ),
    Animal(
      id: '2',
      customerId: '2',
      name: 'Mimi',
      dob: '2021-07-05',
      species: 'Kucing',
    ),
    Animal(
      id: '3',
      customerId: '3',
      name: 'Coco',
      dob: '2019-11-22',
      species: 'Kucing',
    ),
    Animal(
      id: '4',
      customerId: '4',
      name: 'Lulu',
      dob: '2022-02-14',
      species: 'Anjing',
    ),
    Animal(
      id: '5',
      customerId: '5',
      name: 'Rocky',
      dob: '2020-09-30',
      species: 'Kucing',
    ),
  ];

  List<Animal> filteredAnimals = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredAnimals = animals;
  }

  void _runFilter(String keyword) {
    List<Animal> results = [];
    if (keyword.isEmpty) {
      results = animals;
    } else {
      results = animals
          .where((a) => a.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredAnimals = results;
    });
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  void _confirmDelete(String id) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: const Text('Yakin ingin menghapus data hewan ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                animals.removeWhere((item) => item.id == id);
                _runFilter(searchController.text);
              });
              Navigator.of(ctx).pop();
              _showSnackbar('Data hewan dihapus', Colors.red);
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<bool> _confirmCancel() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Batalkan?'),
            content: const Text('Perubahan tidak akan disimpan.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Lanjut'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Ya, Batalkan'),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _showFormDialog({Animal? animal}) {
    final nameController = TextEditingController(text: animal?.name ?? '');
    final customerIdController = TextEditingController(
      text: animal?.customerId ?? '',
    );
    final dobController = TextEditingController(text: animal?.dob ?? '');
    final speciesController = TextEditingController(
      text: animal?.species ?? '',
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: _confirmCancel,
        child: AlertDialog(
          title: Text(animal == null ? 'Tambah Hewan' : 'Edit Hewan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: customerIdController,
                decoration: const InputDecoration(
                  labelText: 'ID Customer (Pemilik)',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nama Hewan'),
              ),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Lahir (YYYY-MM-DD)',
                ),
              ),
              TextField(
                controller: speciesController,
                decoration: const InputDecoration(
                  labelText: 'Jenis (Anjing/Kucing)',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (await _confirmCancel()) {
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                }
              },
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty) {
                  _showSnackbar('Nama Hewan wajib diisi', Colors.orange);
                  return;
                }

                if (animal == null) {
                  final newAnimal = Animal(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    customerId: customerIdController.text,
                    name: nameController.text,
                    dob: dobController.text,
                    species: speciesController.text,
                  );
                  setState(() {
                    animals.add(newAnimal);
                    _runFilter(searchController.text);
                  });
                  _showSnackbar('Hewan berhasil ditambahkan', Colors.green);
                } else {
                  setState(() {
                    animal.customerId = customerIdController.text;
                    animal.name = nameController.text;
                    animal.dob = dobController.text;
                    animal.species = speciesController.text;
                    _runFilter(searchController.text);
                  });
                  _showSnackbar('Data hewan diperbarui', Colors.blue);
                }
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Hewan (CS)'),
        backgroundColor: Colors.green.shade100,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Cari Hewan...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredAnimals.isEmpty
                ? const Center(child: Text('Tidak ada data hewan'))
                : ListView.builder(
                    itemCount: filteredAnimals.length,
                    itemBuilder: (context, index) {
                      final item = filteredAnimals[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.pets,
                            color: item.species.toLowerCase().contains('anjing')
                                ? Colors.brown
                                : Colors.orange,
                          ),
                          title: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Jenis: ${item.species} | Lahir: ${item.dob}\nID Pemilik: ${item.customerId}',
                          ),
                          isThreeLine: true,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                                onPressed: () => _showFormDialog(animal: item),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () => _confirmDelete(item.id),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade100,
        onPressed: () => _showFormDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
