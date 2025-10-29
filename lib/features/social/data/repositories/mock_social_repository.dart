import '../../domain/entities/post.dart';
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
    _mockPosts = [
      Post(
        id: '1',
        content: 'Does anyone know a good plumber? I have a leaky faucet.',
        author: _mockUsers[0],
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        status: PostStatus.approved,
        mediaUrls: [],
        likesCount: 3,
        commentsCount: 2,
        isLiked: false,
      ),
      Post(
        id: '2',
        content:
            'Community BBQ this Saturday at 4 PM in the main courtyard. Everyone is welcome! Bring your favorite dish.',
        author: _mockUsers[1],
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        status: PostStatus.approved,
        mediaUrls: [
          'https://picsum.photos/400/300?random=1',
          "https://picsum.photos/400/300?random=3",
        ],
        likesCount: 8,
        commentsCount: 5,
        isLiked: true,
      ),
      Post(
        id: '3',
        content:
            'Has anyone seen my cat? He\'s been missing since yesterday. White with brown spots.',
        author: _mockUsers[2],
        createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
        status: PostStatus.pending,
        mediaUrls: [
          'https://picsum.photos/400/300?random=2',
          "https://picsum.photos/400/300?random=4",
        ],
        likesCount: 0,
        commentsCount: 0,
        isLiked: false,
      ),
      Post(
        id: '4',
        content:
            'Thank you to whoever returned my lost wallet! Faith in humanity restored.',
        author: _mockUsers[0],
        createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
        status: PostStatus.approved,
        mediaUrls: [],
        likesCount: 12,
        commentsCount: 3,
        isLiked: false,
      ),
    ];
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
    required String userId,
    int page = 1,
    int limit = 10,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));

    // Return posts by the specified user
    final userPosts = _mockPosts
        .where((post) => post.author.id == userId)
        .toList();

    // Sort by creation date (newest first)
    userPosts.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return userPosts;
  }

  @override
  Future<Post> createPost({
    required String content,
    required String userId,
    List<String> mediaUrls = const [],
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 1000));

    // Find the user
    final user = _mockUsers.firstWhere(
      (u) => u.id == userId,
      orElse: () => _mockUsers[0],
    );

    // Create new post
    final newPost = Post(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      author: user,
      createdAt: DateTime.now(),
      status: PostStatus.pending, // New posts start as pending
      mediaUrls: mediaUrls,
      likesCount: 0,
      commentsCount: 0,
      isLiked: false,
    );

    _mockPosts.add(newPost);

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
  Future<Map<String, dynamic>> toggleLike({
    required String postId,
    required String userId,
  }) async {
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
    }

    return {'success': true};
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
