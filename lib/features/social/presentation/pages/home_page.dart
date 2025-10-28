import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              
              // App Logo/Title
              Icon(
                Icons.home_rounded,
                size: 80,
                color: AppColors.primary,
              ),
              
              const SizedBox(height: AppSpacing.xxl),
              
              Text(
                'MicroLink',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: AppSpacing.md),
              
              Text(
                'Connect with your community',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              
              const Spacer(),
              
              // Navigation Cards
              _buildNavigationCard(
                context,
                icon: Icons.map,
                title: 'Map',
                subtitle: 'Explore your neighborhood',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Map feature coming soon!')),
                  );
                },
              ),
              
              const SizedBox(height: AppSpacing.lg),
              
              _buildNavigationCard(
                context,
                icon: Icons.people,
                title: 'Socials',
                subtitle: 'Connect with neighbors',
                onTap: () => context.go('/social'),
                isPrimary: true,
              ),
              
              const SizedBox(height: AppSpacing.lg),
              
              _buildNavigationCard(
                context,
                icon: Icons.home,
                title: 'My Unit',
                subtitle: 'Manage your space',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('My Unit feature coming soon!')),
                  );
                },
              ),
              
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isPrimary = false,
  }) {
    return Card(
      elevation: isPrimary ? 4 : 2,
      color: isPrimary ? AppColors.primary : AppColors.surface,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.cardPadding),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isPrimary 
                      ? AppColors.textOnPrimary.withOpacity(0.2)
                      : AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                ),
                child: Icon(
                  icon,
                  color: isPrimary ? AppColors.textOnPrimary : AppColors.primary,
                  size: 24,
                ),
              ),
              
              const SizedBox(width: AppSpacing.lg),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.userName.copyWith(
                        color: isPrimary ? AppColors.textOnPrimary : AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: AppTextStyles.caption.copyWith(
                        color: isPrimary 
                            ? AppColors.textOnPrimary.withOpacity(0.8)
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              
              Icon(
                Icons.arrow_forward_ios,
                color: isPrimary 
                    ? AppColors.textOnPrimary.withOpacity(0.6)
                    : AppColors.iconInactive,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
