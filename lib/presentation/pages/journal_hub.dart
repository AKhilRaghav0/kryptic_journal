import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/metro_pivot_view.dart';
import '../widgets/hybrid_components.dart';
import '../../core/theme/app_theme.dart';

class JournalHub extends StatelessWidget {
  const JournalHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      body: SafeArea(
        child: MetroPivotView(
          items: [
            PivotItem(title: 'start', content: const StartView()),
            PivotItem(title: 'recent', content: const RecentEntriesView()),
            PivotItem(title: 'all entries', content: const AllEntriesView()),
            PivotItem(title: 'people', content: const PeopleView()),
          ],
        ),
      ),
    );
  }
}

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          HybridLiveTile(
            title: 'new entry',
            icon: Icons.add,
            backgroundColor: AppTheme.tileBlue,
            size: HybridTileSize.small,
            useElevation: true,
            onTap: () {},
          ),
          HybridLiveTile(
            title: 'recent entries',
            count: '12',
            backgroundColor: AppTheme.tileGreen,
            size: HybridTileSize.wide,
            useGradient: true,
            gradient: MetroColors.getGradient(0),
            onTap: () {},
          ),
          HybridLiveTile(
            title: 'quick note',
            icon: Icons.edit,
            backgroundColor: AppTheme.tileOrange,
            size: HybridTileSize.small,
            useElevation: true,
            onTap: () {},
          ),
          HybridLiveTile(
            title: 'voice memo',
            icon: Icons.mic,
            backgroundColor: AppTheme.tilePurple,
            size: HybridTileSize.small,
            useGradient: true,
            gradient: MetroColors.getGradient(1),
            onTap: () {},
          ),
          HybridLiveTile(
            title: 'mood tracker',
            subtitle: 'feeling good',
            backgroundColor: AppTheme.tileMagenta,
            size: HybridTileSize.wide,
            useElevation: true,
            onTap: () {},
          ),
          HybridLiveTile(
            title: 'insights',
            count: '328',
            subtitle: 'avg words',
            backgroundColor: AppTheme.tileTeal,
            size: HybridTileSize.large,
            useGradient: true,
            gradient: MetroColors.getGradient(2),
            onTap: () {},
          ),
          HybridLiveTile(
            title: 'search',
            icon: Icons.search,
            backgroundColor: AppTheme.tileRed,
            size: HybridTileSize.small,
            useElevation: true,
            onTap: () {},
          ),
          HybridLiveTile(
            title: 'settings',
            icon: Icons.settings,
            backgroundColor: AppTheme.tileBrown,
            size: HybridTileSize.small,
            useGradient: true,
            gradient: MetroColors.getGradient(3),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class RecentEntriesView extends StatelessWidget {
  const RecentEntriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        HybridListItem(
          title: 'morning reflections',
          subtitle: 'today',
          accentColor: AppTheme.tileGreen,
          onTap: () {},
        ),
        HybridListItem(
          title: 'weekend adventures',
          subtitle: 'yesterday',
          accentColor: AppTheme.tileBlue,
          onTap: () {},
        ),
        HybridListItem(
          title: 'book review: time travel',
          subtitle: '2 days ago',
          accentColor: AppTheme.tilePurple,
          onTap: () {},
        ),
        HybridListItem(
          title: 'gratitude list',
          subtitle: '3 days ago',
          accentColor: AppTheme.tileOrange,
          onTap: () {},
        ),
        HybridListItem(
          title: 'career thoughts',
          subtitle: '1 week ago',
          accentColor: AppTheme.tileTeal,
          onTap: () {},
        ),
        HybridListItem(
          title: 'travel planning',
          subtitle: '1 week ago',
          accentColor: AppTheme.tileMagenta,
          onTap: () {},
        ),
      ],
    );
  }
}

class AllEntriesView extends StatelessWidget {
  const AllEntriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search section
        Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Clean search bar
              HybridCard(
                useElevation: true,
                child: Row(
                  children: [
                    Icon(Icons.search, color: AppTheme.textSecondary, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'search entries...',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Filter options
              Wrap(
                spacing: 16,
                children: [
                  _buildFilterOption('all', true),
                  _buildFilterOption('text', false),
                  _buildFilterOption('voice', false),
                  _buildFilterOption('photos', false),
                ],
              ),
            ],
          ),
        ),
        // Entries by month
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              _buildMonthSection(context, 'december 2024', [
                HybridListItem(
                  title: 'morning reflections',
                  subtitle: 'dec 15',
                  accentColor: AppTheme.tileGreen,
                  onTap: () {},
                ),
                HybridListItem(
                  title: 'travel dreams',
                  subtitle: 'dec 12',
                  accentColor: AppTheme.tileBlue,
                  onTap: () {},
                ),
                HybridListItem(
                  title: 'recipe ideas',
                  subtitle: 'dec 10',
                  accentColor: AppTheme.tileOrange,
                  onTap: () {},
                ),
              ]),
              const SizedBox(height: 40),
              _buildMonthSection(context, 'november 2024', [
                HybridListItem(
                  title: 'thanksgiving thoughts',
                  subtitle: 'nov 28',
                  accentColor: AppTheme.tilePurple,
                  onTap: () {},
                ),
                HybridListItem(
                  title: 'career goals',
                  subtitle: 'nov 25',
                  accentColor: AppTheme.tileRed,
                  onTap: () {},
                ),
                HybridListItem(
                  title: 'book club notes',
                  subtitle: 'nov 20',
                  accentColor: AppTheme.tileTeal,
                  onTap: () {},
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterOption(String label, bool isSelected) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: isSelected ? AppTheme.primaryAccent : AppTheme.textSecondary,
        decoration: isSelected ? TextDecoration.underline : null,
        decorationColor: AppTheme.primaryAccent,
        decorationThickness: 2,
      ),
    );
  }

  Widget _buildMonthSection(
    BuildContext context,
    String month,
    List<Widget> entries,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          month,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: AppTheme.textSecondary),
        ),
        const SizedBox(height: 20),
        ...entries,
      ],
    );
  }
}

class PeopleView extends StatelessWidget {
  const PeopleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          'shared with',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: AppTheme.textSecondary),
        ),
        const SizedBox(height: 24),
        HybridListItem(
          title: 'family journal',
          subtitle: '12 entries',
          accentColor: AppTheme.tileGreen,
          onTap: () {},
        ),
        HybridListItem(
          title: 'travel buddy',
          subtitle: '5 entries',
          accentColor: AppTheme.tileBlue,
          onTap: () {},
        ),
        HybridListItem(
          title: 'book club',
          subtitle: '8 entries',
          accentColor: AppTheme.tilePurple,
          onTap: () {},
        ),
        const SizedBox(height: 40),
        Text(
          'contacts',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: AppTheme.textSecondary),
        ),
        const SizedBox(height: 24),
        HybridListItem(
          title: 'sarah johnson',
          subtitle: 'add to journal',
          accentColor: AppTheme.tileOrange,
          onTap: () {},
        ),
        HybridListItem(
          title: 'mike chen',
          subtitle: 'add to journal',
          accentColor: AppTheme.tileTeal,
          onTap: () {},
        ),
        HybridListItem(
          title: 'emma davis',
          subtitle: 'add to journal',
          accentColor: AppTheme.tileMagenta,
          onTap: () {},
        ),
      ],
    );
  }
}
