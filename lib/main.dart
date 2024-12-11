import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.5, end: 1.5).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Timer(const Duration(seconds: 1), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          });
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset('assets/images/logo.png', height: 250),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset('assets/images/register.png', height: 250),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Unknown@gmail.com',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Full name',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'By Signing up, you’re agree to Terms & Conditions and Privacy Policy',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        // Handle sign-up logic here
                      }
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black, // Set text color to black
                        fontWeight: FontWeight.bold, // Make the text bold
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5), // Set the corner radius here
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 200,
                          vertical: 15), // Adjust padding for size
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Join us before? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Center(
                child: Image(
                  image: AssetImage('assets/images/login.png'),
                  height: 200,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forget Password?'),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black, // Set text color to black
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          5), // Set the corner radius here
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 200,
                        vertical: 15), // Adjust padding for size
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text('OR'),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Center row items horizontally
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Center vertically
                    children: [
                      Image.asset(
                        'assets/images/google.png', // Add your google image here
                        height: 24, // Set the image height as per your need
                      ),
                      const SizedBox(
                          width: 10), // Add some space between image and text
                      const Text(
                        'Login With Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15), // Adjust padding for size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Ease'),
        leading: Container(
          padding: const EdgeInsets.all(
              8.0), // Match the padding with the notification button
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F4F7), // Set background color
            borderRadius:
                BorderRadius.circular(20), // Set the same border radius
          ),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Action for the menu button
            },
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4F7), // Set background color
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),
            child: IconButton(
              icon:
                  const Icon(Icons.notifications_outlined, color: Colors.black),
              onPressed: () {
                // Action for the notification button
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4F7), // Set border color
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: const Text(
                        'Safe Travels! Get your routine service done!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Service',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryItem(
                    imagePath: 'assets/images/sandtimer.png',
                    title: 'Service',
                  ),
                  CategoryItem(
                    imagePath: 'assets/images/idea.png',
                    title: 'Pickup',
                  ),
                  CategoryItem(
                    imagePath: 'assets/images/reservation.png',
                    title: 'Reservation',
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Pick Your Needs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // First Box (Book Your Agent)
                  Container(
                    width: 180, // Increased width for the box
                    height: 240, // Increased height for the box
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10), // Apply radius to image
                          child: Image.asset(
                            'assets/images/agent.png', // Image for "Book Your Agent"
                            width: 160, // Increased image width
                            height: 160, // Increased image height
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Book Your Agent', // Text below the image
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center, // Center-align the text
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '1h 30 min', // Duration below the title
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  // Second Box (Track Your Service)
                  Container(
                    width: 180, // Increased width for the box
                    height: 240, // Increased height for the box
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10), // Apply radius to image
                          child: Image.asset(
                            'assets/images/track.png', // Image for "Track Your Service"
                            width: 160, // Increased image width
                            height: 160, // Increased image height
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Track Your Service', // Text below the image
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center, // Center-align the text
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '1h 12 min', // Duration below the title
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // For fixed icons
        selectedItemColor:
            Colors.black, // Change the label color to black when selected
        unselectedItemColor:
            Color(0xFF9E9E9E), // Set the label color to gray when not selected
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _currentIndex == 0
                  ? ColorFilter.mode(
                      Colors.black, BlendMode.srcIn) // Selected icon color
                  : ColorFilter.mode(Color(0xFF9E9E9E),
                      BlendMode.srcIn), // Unselected icon color
              child: Image.asset(
                'assets/images/home.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _currentIndex == 1
                  ? ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xFF9E9E9E), BlendMode.srcIn),
              child: Image.asset(
                'assets/images/history.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _currentIndex == 2
                  ? ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xFF9E9E9E), BlendMode.srcIn),
              child: Image.asset(
                'assets/images/payment.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _currentIndex == 3
                  ? ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xFF9E9E9E), BlendMode.srcIn),
              child: Image.asset(
                'assets/images/profile.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String title;

  const CategoryItem({Key? key, required this.imagePath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to different screens based on the title
        if (title == 'Service') {
        } else if (title == 'Pickup') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PickUpScreen()),
          );
        } else if (title == 'Reservation') {}
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F4F7), // Background color
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align items to the left
          children: [
            Image.asset(
              imagePath, // Image for the category
              width: 30, // Set the width of the image as per your requirement
              height: 30, // Set the height of the image as per your requirement
            ),
            const SizedBox(width: 10), // Space between the image and text
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PickUpScreen extends StatefulWidget {
  const PickUpScreen({Key? key}) : super(key: key);

  @override
  _PickUpScreenState createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Ease'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4F7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon:
                  const Icon(Icons.notifications_outlined, color: Colors.black),
              onPressed: () {
                // Action for the notification button
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Intro Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4F7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: const Text(
                        'Safe Travels! Pick up your service from the nearest location.',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Where to pick up?',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Pick Up Locations Title
              const Text(
                'Pick Up Locations',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Location Items
              LocationItem(
                location: 'Telkom University Land Mark Tower',
                description: 'Jl. Telekomunikasi No.1 Sukapura, Dayeuhkolot, Bandung',
                imagePath: 'assets/images/location.png',
              ),
              LocationItem(
                location: 'Pondok Fajar Citeurup',
                description: 'Jl. Sukabirus No.52, Citeurup, Dayeuhkolot, Bandung, Jawa Barat',
                imagePath: 'assets/images/location.png',
              ),
              const SizedBox(height: 40),
              const Text(
                'Pick Your Needs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // First Box (Book Your Agent)
                  Container(
                    width: 180, // Increased width for the box
                    height: 240, // Increased height for the box
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10), // Apply radius to image
                          child: Image.asset(
                            'assets/images/agent.png', // Image for "Book Your Agent"
                            width: 160, // Increased image width
                            height: 160, // Increased image height
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Book Your Agent', // Text below the image
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center, // Center-align the text
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '1h 30 min', // Duration below the title
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  // Second Box (Track Your Service)
                  Container(
                    width: 180, // Increased width for the box
                    height: 240, // Increased height for the box
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10), // Apply radius to image
                          child: Image.asset(
                            'assets/images/track.png', // Image for "Track Your Service"
                            width: 160, // Increased image width
                            height: 160, // Increased image height
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Track Your Service', // Text below the image
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center, // Center-align the text
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '1h 12 min', // Duration below the title
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFF9E9E9E),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _currentIndex == 0
                  ? ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xFF9E9E9E), BlendMode.srcIn),
              child: Image.asset(
                'assets/images/home.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _currentIndex == 1
                  ? ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xFF9E9E9E), BlendMode.srcIn),
              child: Image.asset(
                'assets/images/history.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _currentIndex == 2
                  ? ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xFF9E9E9E), BlendMode.srcIn),
              child: Image.asset(
                'assets/images/payment.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(
              colorFilter: _currentIndex == 3
                  ? ColorFilter.mode(Colors.black, BlendMode.srcIn)
                  : ColorFilter.mode(Color(0xFF9E9E9E), BlendMode.srcIn),
              child: Image.asset(
                'assets/images/profile.png',
                width: 24,
                height: 24,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class LocationItem extends StatelessWidget {
  final String location;
  final String description;
  final String imagePath;

  const LocationItem({
    required this.location,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 16), // Space between image and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                location,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.black54, // Lighter text for the description
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
