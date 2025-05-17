import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'account_model.dart';

class Account extends StackedView<AccountModel> {
  const Account({super.key});

  @override
  Widget builder(
    BuildContext context,
    AccountModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Handle settings icon press
            // viewModel.navigateToSetings();
          },
        ),
        title: const Text('My Account'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              // viewModel.handleMenuSelection(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'edit_profile',
                  child: Text('Edit Profile'),
                ),
                const PopupMenuItem<String>(
                  value: 'help',
                  child: Text('Help & Support'),
                ),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Log Out'),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/avatar1.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Natalie Anderson',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'natalie@mail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Stats Row
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '53',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Following'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '37',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Certificates'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '46',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Finished Courses'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Favorite Categories
            const Text(
              'Favorite Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Table(
              children: const [
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('History'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Business & Management'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Law'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Politics & Society'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Literature'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Science'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Payment Cards
            const Text(
              'Payment Cards',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildPaymentCard(
              title: 'Main card',
              cardNumber: '9532 5558 8886 8888',
            ),
            const SizedBox(height: 12),
            _buildPaymentCard(
              title: 'Oscar\'s card',
              cardNumber: '6667 6857',
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add new card'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCard(
      {required String title, required String cardNumber}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(cardNumber),
          ],
        ),
      ),
    );
  }

  @override
  AccountModel viewModelBuilder(BuildContext context) => AccountModel();
}
