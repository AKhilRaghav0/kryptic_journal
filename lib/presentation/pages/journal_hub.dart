import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
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
            PivotItem(title: '', content: const DashboardView(), icon: HeroIcons.bookOpen), // Book icon for dashboard
            PivotItem(title: 'list', content: const ListEntriesView()),
            PivotItem(title: 'calendar', content: const CalendarView()),
            PivotItem(title: 'media', content: const MediaView()),
            PivotItem(title: 'map', content: const MapView()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to new entry screen
        },
        icon: const HeroIcon(HeroIcons.plus),
        label: Text(
          'New entry',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppTheme.backgroundWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppTheme.primaryAccent,
        foregroundColor: AppTheme.backgroundWhite,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppTheme.backgroundWhite,
        selectedItemColor: AppTheme.primaryAccent,
        unselectedItemColor: AppTheme.textSecondary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.bookOpen),
            label: 'Journals',
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.ellipsisHorizontal),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

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
            icon: HeroIcons.plus,
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
            icon: HeroIcons.pencil,
            backgroundColor: AppTheme.tileOrange,
            size: HybridTileSize.small,
            useElevation: true,
            onTap: () {},
          ),
          HybridLiveTile(
            title: 'voice memo',
            icon: HeroIcons.microphone,
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
            icon: HeroIcons.magnifyingGlass,
            backgroundColor: AppTheme.tileRed,
            size: HybridTileSize.small,
            useElevation: true,
            onTap: () {},
          ),
          HybridLiveTile(
            title: 'settings',
            icon: HeroIcons.cog6Tooth,
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
                    HeroIcon(HeroIcons.magnifyingGlass, color: AppTheme.textSecondary, size: 20),
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

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'June 2025',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              _buildDayEntry(context, 'SAT', '28', 'Day 1 of Journaling my Thoughts', 'Journal • 11:45 am'),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'July 2024',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
              _buildDayEntry(context, 'SUN', '07', 'Day One Essentials Guide', 'Welcome to Day One, we\'re glad you\'re here...', subtitle: 'Journal • 1:10 pm'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDayEntry(BuildContext context, String dayOfWeek, String day, String title, String content, {String? subtitle}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date column
          Container(
            width: 60,
            child: Column(
              children: [
                Text(
                  dayOfWeek,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  day,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Content column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.primaryAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MediaView extends StatelessWidget {
  const MediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          'Photos & Media',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        HybridCard(
          child: Column(
            children: [
              HeroIcon(
                HeroIcons.photo,
                size: 48,
                color: AppTheme.textLight,
              ),
              const SizedBox(height: 16),
              Text(
                'No photos yet',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Photos from your entries will appear here',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textLight,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(
          'Places',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        HybridCard(
          child: Column(
            children: [
              HeroIcon(
                HeroIcons.mapPin,
                size: 48,
                color: AppTheme.textLight,
              ),
              const SizedBox(height: 16),
              Text(
                'No locations yet',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Locations from your entries will appear here',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textLight,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ListEntriesView extends StatelessWidget {
  const ListEntriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        // June 2025 section
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
          child: Text(
            'June 2025',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _buildEntryItem(context, 'SAT', '28', 'Day 1 of Journaling my Thoughts', 'Journal • 11:45 am'),
        
        // July 2024 section
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 8),
          child: Text(
            'July 2024',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _buildEntryItem(context, 'SUN', '07', 'Day One Essentials Guide', 'Welcome to Day One, we\'re glad you\'re here. If you\'re wondering what you can do with your new journal, yo...', subtitle: 'Journal • 1:10 pm'),
      ],
    );
  }

  Widget _buildEntryItem(BuildContext context, String dayOfWeek, String day, String title, String content, {String? subtitle}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date column
          Container(
            width: 50,
            child: Column(
              children: [
                Text(
                  dayOfWeek,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  day,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Content column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle ?? content,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: subtitle != null ? AppTheme.primaryAccent : AppTheme.textSecondary,
                    fontWeight: subtitle != null ? FontWeight.w500 : FontWeight.w400,
                  ),
                  maxLines: subtitle != null ? 1 : 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
