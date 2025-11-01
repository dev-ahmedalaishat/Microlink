import '../../domain/entities/create_post_params.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/toggle_like_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/social_repository.dart';

class MockSocialRepository implements SocialRepository {
  // Mock data
  final List<User> _mockUsers = [
    const User(
      id: '1',
      name: 'Jane Smith',
      avatarUrl:
          'https://ui-avatars.com/api/?name=Jane+Smith&background=008080&color=fff',
    ),
    const User(
      id: '2',
      name: 'John Doe',
      avatarUrl:
          'https://ui-avatars.com/api/?name=John+Doe&background=008080&color=fff',
    ),
    const User(
      id: '3',
      name: 'Alice Johnson',
      avatarUrl:
          'https://ui-avatars.com/api/?name=Alice+Johnson&background=008080&color=fff',
    ),
  ];

  List<Post> _mockPosts = [];

  MockSocialRepository() {
    _initializeMockPosts();
  }

  void _initializeMockPosts() {
    final List<String> sampleContents = [
      'Does anyone know a good plumber? I have a leaky faucet.',
      'Community BBQ this Saturday at 4 PM in the main courtyard. Everyone is welcome! Bring your favorite dish.',
      'Has anyone seen my cat? He\'s been missing since yesterday. White with brown spots.',
      'Thank you to whoever returned my lost wallet! Faith in humanity restored.',
      'Looking for a babysitter for next weekend. Please DM if interested.',
      'The elevator in building A is out of order again. Please use the stairs.',
      'Free furniture available! Moving out and need to get rid of some items.',
      'Parking spot #25 is available for rent. \$100/month.',
      'Pool maintenance scheduled for tomorrow morning from 8-10 AM.',
      'Lost keys near the mailboxes. Black Honda keychain. Please contact me!',
      'Yoga class every Tuesday at 6 PM in the community room. All levels welcome.',
      'Book club meeting this Thursday. We\'re discussing "The Great Gatsby".',
      'Anyone interested in carpooling to downtown? I leave at 8 AM daily.',
      'Noise complaint about unit 304. Please keep it down after 10 PM.',
      'Garden club is looking for new members! Love plants? Join us!',
      'Security camera footage needed for incident on Monday night.',
      'Thanksgiving potluck dinner - sign up sheet in the lobby.',
      'Dog walker available for hire. Very reliable and loves pets!',
      'Internet outage in building C. Technician coming tomorrow.',
      'Movie night this Friday - we\'re watching a classic comedy.',
      'Recycling pickup delayed until next Wednesday due to holiday.',
      'New fitness equipment installed in the gym. Check it out!',
      'Bake sale fundraiser for the local school this weekend.',
      'Anyone missing a red bicycle? Found it near building entrance.',
      'Maintenance request: Broken light fixture in hallway.',
      'Community garden spaces available for spring planting.',
      'Fire drill scheduled for next Tuesday at 2 PM. Please participate.',
      'Lost and found items available in the management office.',
      'Snow removal service begins Monday. Please move cars as needed.',
      'Holiday decorations contest! Submit your entries by December 15th.',
      'Tenant meeting next month to discuss new policies.',
      'Power washing of building exteriors scheduled for next week.',
      'New delivery boxes installed near main entrance.',
      'Guest parking is limited. Please use designated spots only.',
      'Piano lessons available! Contact Sarah in unit 207.',
      'Pest control service coming Thursday. Please secure food items.',
      'Community bulletin board needs updating. Volunteers wanted.',
      'Water heater maintenance in building B this weekend.',
      'New security patrol schedule starts Monday.',
      'Craft workshop for kids this Saturday in the activity room.',
      'Garage sale permits available at the management office.',
      'Landscaping work begins next week. Expect some noise.',
      'Tennis court reservations now available online.',
      'Package delivery issues? Please report to management.',
      'Weekly newsletter available - check your mailbox.',
      'Heating system inspection scheduled for all units.',
      'New playground equipment installed! Kids will love it.',
      'Neighborhood watch meeting every first Monday.',
      'Seasonal pool hours change starting next month.',
      'Building insurance renewal meeting for homeowners.',
      'Emergency contact information update required.',
      'Storage unit rentals available. Limited spaces left.',
      'Community Wi-Fi password has been updated.',
      'Volunteer needed for holiday event planning committee.',
      'Trash collection schedule change due to construction.',
    ];

    _mockPosts = [];

    // Generate 60 posts with varied data
    for (int i = 0; i < 60; i++) {
      final contentIndex = i % sampleContents.length;
      final userIndex = i % _mockUsers.length;
      final hoursAgo = i * 2; // Spread posts over time

      // Mix of approved, pending, and rejected posts
      PostStatus status;
      if (i % 4 == 0) {
        status = PostStatus.pending;
      } else if (i % 7 == 0) {
        status = PostStatus.rejected;
      } else {
        status = PostStatus.approved;
      }

      // Some posts have media, some don't
      List<String> mediaUrls = [];
      if (i % 3 == 0) {
        mediaUrls = ['https://picsum.photos/400/300?random=${i + 1}'];
      } else if (i % 5 == 0) {
        mediaUrls = [
          'https://picsum.photos/400/300?random=${i + 1}',
          'https://picsum.photos/400/300?random=${i + 2}',
        ];
      }

      _mockPosts.add(
        Post(
          id: (i + 1).toString(),
          content: sampleContents[contentIndex],
          author: _mockUsers[userIndex],
          createdAt: DateTime.now().subtract(Duration(hours: hoursAgo)),
          status: status,
          mediaUrls: mediaUrls,
          likesCount: (i * 3) % 15, // Varied like counts
          commentsCount: (i * 2) % 8, // Varied comment counts
          isLiked: i % 4 == 1, // Some posts are liked
        ),
      );
    }
  }

  @override
  Future<List<Post>> getLatestPosts({
    int page = 1,
    int limit = 10,
    bool forceRefresh = false,
  }) async {
    if (forceRefresh) {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));
    }

    // Return only approved posts
    final approvedPosts = _mockPosts
        .where((post) => post.status == PostStatus.approved)
        .toList();

    // Sort by creation date (newest first)
    approvedPosts.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return approvedPosts;
  }

  @override
  Future<List<Post>> getMyPosts({
    int page = 1,
    int limit = 10,
    bool forceRefresh = false,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));

    // Return posts by the specified user
    final userPosts = _mockPosts
        .where((post) => post.author.id == '1')
        .toList();

    // Sort by creation date (newest first)
    userPosts.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return userPosts;
  }

  @override
  Future<Post> createPost(CreatePostParams params) async {
    // Simulate API call delay (network latency)
    await Future.delayed(const Duration(milliseconds: 800));

    // Use first mock user as the post author (simulating authenticated user)
    final user = _mockUsers[0];

    // Create new post with PENDING status (matching API behavior)
    // Posts created by users are pending approval from admin
    final newPost = Post(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: params.content,
      author: user,
      createdAt: DateTime.now(),
      status:
          PostStatus.pending, // PENDING_APPROVAL - waiting for admin approval
      mediaUrls: params.mediaUrls, // Include all images from the request
      likesCount: 0,
      commentsCount: 0,
      isLiked: false,
    );

    // Add to mock posts list (simulating database save)
    _mockPosts.add(newPost);

    // Return the created post (matching API response)
    return newPost;
  }

  @override
  Future<List<Map<String, dynamic>>> getComments(String postId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 400));

    // Mock comments data
    return [
      {
        'id': '1',
        'content': 'I saw a white cat near building 5 this morning!',
        'author': {'name': 'Sarah Wilson', 'id': '4'},
        'created_at': DateTime.now()
            .subtract(const Duration(minutes: 10))
            .toIso8601String(),
      },
      {
        'id': '2',
        'content': 'Let me know if you need help searching!',
        'author': {'name': 'Mike Chen', 'id': '5'},
        'created_at': DateTime.now()
            .subtract(const Duration(minutes: 5))
            .toIso8601String(),
      },
    ];
  }

  @override
  Future<Map<String, dynamic>> addComment({
    required String postId,
    required String content,
    required String userId,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));

    return {
      'success': true,
      'comment': {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'content': content,
        'author': {'name': 'You', 'id': userId},
        'created_at': DateTime.now().toIso8601String(),
      },
    };
  }

  @override
  Future<ToggleLikeResult> toggleLike({required String postId}) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Find the post and toggle like
    final postIndex = _mockPosts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      final post = _mockPosts[postIndex];
      final newLiked = !post.isLiked;
      final newCount = newLiked ? post.likesCount + 1 : post.likesCount - 1;

      _mockPosts[postIndex] = post.copyWith(
        isLiked: newLiked,
        likesCount: newCount,
      );

      return ToggleLikeResult(isLiked: newLiked, likesCount: newCount);
    }

    throw Exception('Post not found');
  }

  @override
  Future<String?> extractUserId() async {
    // Return a mock user ID
    return _mockUsers[0].id;
  }

  @override
  Future<bool> healthCheck() async {
    return true;
  }

  // Helper method to get current user
  User getCurrentUser() => _mockUsers[0];
}
