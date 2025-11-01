import '../../domain/entities/create_post_params.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/toggle_like_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/comment.dart';
import '../../domain/repositories/social_repository.dart';

class MockSocialRepository implements SocialRepository {
  // Mock data
  final List<User> _mockUsers = [
    const User(
      id: '1',
      name: 'Jane Smith',
      avatarUrl:
          'https://ui-avatars.com/api/?name=Jane+Smith&background=008080&color=fff',
      unitDetails: 'Building 1, Unit 205',
    ),
    const User(
      id: '2',
      name: 'John Doe',
      avatarUrl:
          'https://ui-avatars.com/api/?name=John+Doe&background=008080&color=fff',
      unitDetails: 'Building 5, Unit 101',
    ),
    const User(
      id: '3',
      name: 'Alice Johnson',
      avatarUrl:
          'https://ui-avatars.com/api/?name=Alice+Johnson&background=008080&color=fff',
      unitDetails: 'Building 2, Unit 304',
    ),
    const User(
      id: 'b780223a-a88c-45da-bea9-70e44d9f2837',
      name: 'John Doe',
      avatarUrl:
          'https://ui-avatars.com/api/?name=John+Doe&background=008080&color=fff',
      unitDetails: 'Building 5, Unit 101',
    ),
    const User(
      id: '4',
      name: 'Sarah Wilson',
      avatarUrl:
          'https://ui-avatars.com/api/?name=Sarah+Wilson&background=008080&color=fff',
      unitDetails: 'Building 3, Unit 102',
    ),
    const User(
      id: '5',
      name: 'Mike Chen',
      avatarUrl:
          'https://ui-avatars.com/api/?name=Mike+Chen&background=008080&color=fff',
      unitDetails: 'Building 4, Unit 201',
    ),
    const User(
      id: '6',
      name: 'Emma Davis',
      avatarUrl:
          'https://ui-avatars.com/api/?name=Emma+Davis&background=008080&color=fff',
      unitDetails: 'Building 1, Unit 305',
    ),
    const User(
      id: '7',
      name: 'David Brown',
      avatarUrl:
          'https://ui-avatars.com/api/?name=David+Brown&background=008080&color=fff',
      unitDetails: 'Building 6, Unit 401',
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
  Future<List<Comment>> getComments(String postId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 400));

    // Generate mock comments for any post
    final List<Comment> mockComments = [
      Comment(
        id: '8a10b424-d362-4c41-bbf3-ad1ccbdc6d06',
        postId: postId,
        content:
            'I used Mike\'s Plumbing last month. Great service! Call 555-0123.',
        author: _mockUsers.firstWhere(
          (u) => u.id == 'b780223a-a88c-45da-bea9-70e44d9f2837',
        ),
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Comment(
        id: '9b21c535-e473-5d52-ccf4-be2ddc2b7e17',
        postId: postId,
        content:
            'I saw a white cat near building 5 this morning! Let me know if you find him.',
        author: _mockUsers.firstWhere((u) => u.id == '4'),
        createdAt: DateTime.now().subtract(const Duration(minutes: 45)),
      ),
      Comment(
        id: '7c32d646-f584-6e63-ddf5-cf3eea3c8f28',
        postId: postId,
        content:
            'Let me know if you need help searching! I walk my dog around that area every evening.',
        author: _mockUsers.firstWhere((u) => u.id == '5'),
        createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
      Comment(
        id: '6d43e757-g695-7f74-eeg6-dg4ffb4d9g39',
        postId: postId,
        content: 'Thanks for organizing this! Can\'t wait to meet everyone.',
        author: _mockUsers.firstWhere((u) => u.id == '6'),
        createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
      Comment(
        id: '5e54f868-h7a6-8g85-ffh7-eh5ggh5e0h4a',
        postId: postId,
        content: 'Great initiative! This is exactly what our community needs.',
        author: _mockUsers.firstWhere((u) => u.id == '7'),
        createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
    ];

    // Return a random subset of comments (2-4 comments per post)
    final postHash = postId.hashCode;
    final numComments = 2 + (postHash.abs() % 3); // 2-4 comments
    final startIndex = postHash.abs() % (mockComments.length - numComments + 1);

    return mockComments.sublist(startIndex, startIndex + numComments);
  }

  @override
  Future<Comment> addComment({
    required String postId,
    required String content,
    required String userId,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));

    // Find the user who is adding the comment
    final User author = _mockUsers.firstWhere(
      (user) => user.id == userId,
      orElse: () =>
          const User(id: '1', name: 'You', unitDetails: 'Building 1, Unit 101'),
    );

    // Create new comment matching API response structure
    final Comment newComment = Comment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      postId: postId,
      content: content,
      author: author,
      createdAt: DateTime.now(),
    );

    return newComment;
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
