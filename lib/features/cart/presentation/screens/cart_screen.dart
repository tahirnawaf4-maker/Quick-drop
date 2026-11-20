import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quick_drop/core/constants/app_colors.dart';
import 'package:quick_drop/features/checkout/presentation/screens/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List cartItems = [
    {
      'name': 'وجبة برجر دبل تشيز',
      'price': 45.0,
      'quantity': 2,
      'icon': Icons.fastfood_rounded,
    },
    {
      'name': 'وجبة بيتزا',
      'price': 60.0,
      'quantity': 1,
      'icon': Icons.local_pizza_rounded,
    },
    {
      'name': 'وجبة سوشي',
      'price': 80.0,
      'quantity': 3,
      'icon': Icons.set_meal_rounded,
    },
  ];
  double get _subtotal {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  } // Example list of cart items

  final double _deliveryFee = 10.0; // Example delivery fee
  @override
  Widget build(BuildContext context) {
    double total = _subtotal + _deliveryFee;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            'سلة المشتريات',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimarylight,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFFFAF8F2),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.primary,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
        body: cartItems.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 100,
                      color: AppColors.primary,
                    ),

                    const SizedBox(height: 20),
                    Text('سلة المشتريات فارغة!'),
                  ],
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: cartItems.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return _buildCartItem(item, index);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFFAF8F2),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'المجموع الفرعي',
                              style: TextStyle(
                                color: AppColors.textSeconderyLight,
                              ),
                            ),
                            Text(
                              '${_subtotal.toStringAsFixed(2)} ريال',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'رسوم التوصيل',
                              style: TextStyle(
                                color: AppColors.textSeconderyLight,
                              ),
                            ),
                            Text(
                              '${_deliveryFee.toStringAsFixed(2)} ريال',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Divider(
                          height: 24,
                          thickness: 1,
                          color: AppColors.secondery.withOpacity(0.3),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'المجموع الكلي',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimarylight,
                              ),
                            ),
                            Text(
                              '${total.toStringAsFixed(2)} ريال',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckoutScreen(
                                    subtotal: _subtotal,
                                    deliveryFee: _deliveryFee,
                                  ),
                                ),
                              );
                              // Handle checkout action
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColors.primary,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'إتمام الطلب',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item, int index) {
    return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFFFAF8F2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(item['icon'], color: AppColors.primary, size: 28),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimarylight,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'السعر: ${item['price']} ريال',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSeconderyLight,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (item['quantity'] > 1) {
                          item['quantity']--;
                        } else {
                          cartItems.removeAt(index);
                        }
                      });
                    },
                    icon: Icon(
                      Icons.remove_circle_outline_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    '${item['quantity']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimarylight,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        item['quantity']++;
                      });
                    },
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 500.ms, delay: (index * 100).ms)
        .slideX(begin: -0.5, end: 0, duration: 500.ms, delay: (index * 100).ms);
  }
}
