import 'package:flutter/material.dart';
import 'package:pucon2025/ui/common/constants/app_strings.dart';
import 'package:pucon2025/ui/common/customwidget/text_helper.dart';
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
            // viewModel.navigateToSettings();
          },
        ),
        title: text_helper(
          data: 'My Account',
          fontWeight: FontWeight.bold,
          font: roboto,
          size: 20,
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              // viewModel.handleMenuSelection(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                  value: 'edit_profile',
                  child: text_helper(data: 'Edit Profile')),
              PopupMenuItem(
                  value: 'help', child: text_helper(data: 'Help & Support')),
              PopupMenuItem(
                  value: 'logout', child: text_helper(data: 'Logout')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/avatar1.jpg'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text_helper(
                      data: 'Natalie Anderson',
                      fontWeight: FontWeight.bold,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    text_helper(
                      data: 'natalie@mail.com',
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatItem(count: '53', label: 'Following'),
                _StatItem(count: '37', label: 'Certificates'),
                _StatItem(count: '46', label: 'Finished Courses'),
              ],
            ),
            const SizedBox(height: 32),
            text_helper(
              data: 'Favorite Categories',
              fontWeight: FontWeight.bold,
              font: sourceserif,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildCategoryButton('History'),
                _buildCategoryButton('Business & Management'),
                _buildCategoryButton('Law'),
                _buildCategoryButton('Politics & Society'),
                _buildCategoryButton('Literature'),
                _buildCategoryButton('Science'),
              ],
            ),
            const SizedBox(height: 32),
            text_helper(
              data: 'Payment Cards',
              fontWeight: FontWeight.bold,
              size: 18,
            ),
            const SizedBox(height: 12),
            _buildPaymentCard(
                title: 'Main card', cardNumber: '9532 5558 8886 8888'),
            const SizedBox(height: 12),
            _buildPaymentCard(title: 'Oscar\'s card', cardNumber: '6667 6857'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text_helper(
                  data: 'Add new card',
                  fontWeight: FontWeight.bold,
                  size: 16,
                  color: const Color(0xFF1E59F5),
                ),
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E59F5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildCategoryButton(String category) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF1E59F5),
        side: const BorderSide(color: Color(0xFF1E59F5)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: text_helper(data: category),
    );
  }

  static Widget _buildPaymentCard(
      {required String title, required String cardNumber}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.credit_card, size: 20, color: Colors.black54),
        ),
        title: text_helper(data: title, fontWeight: FontWeight.bold),
        subtitle: text_helper(data: cardNumber),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  @override
  AccountModel viewModelBuilder(BuildContext context) => AccountModel();
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        text_helper(data: count, fontWeight: FontWeight.bold, size: 20),
        text_helper(data: label),
      ],
    );
  }
}