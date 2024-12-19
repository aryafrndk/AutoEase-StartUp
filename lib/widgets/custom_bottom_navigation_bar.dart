import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart'; 
import '../screens/paymen_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(index);
        // Check the selected index and navigate accordingly
        switch (index) {
          case 0:
            // Navigate to Dashboard
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );
            break;
          case 1:

            break;
          case 2:
              // Navigate to Payment
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PaymentScreen()),
            );
            break;
          case 3:

            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: const Color(0xFF9E9E9E),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ColorFiltered(
            colorFilter: currentIndex == 0
                ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
                : const ColorFilter.mode(Color(0xFF9E9E9E), BlendMode.srcIn),
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
            colorFilter: currentIndex == 1
                ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
                : const ColorFilter.mode(Color(0xFF9E9E9E), BlendMode.srcIn),
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
            colorFilter: currentIndex == 2
                ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
                : const ColorFilter.mode(Color(0xFF9E9E9E), BlendMode.srcIn),
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
            colorFilter: currentIndex == 3
                ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
                : const ColorFilter.mode(Color(0xFF9E9E9E), BlendMode.srcIn),
            child: Image.asset(
              'assets/images/profile.png',
              width: 24,
              height: 24,
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
