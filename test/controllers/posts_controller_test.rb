require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end


  test "should not save post without image" do
    post = Post.new
    assert_not post.save
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should crate post" do
    assert_difference('Post.count') do
      post post_url, param: { post: {description: "asddas", image:  []}}
    end
    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post, id: @post.id
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post.id)
    assert_response :fail
  end

  test "should update post" do
    patch posts_url(@post), params: { posts: {description: "asddaasds", }}
    assert_redirected_to post_url(@post.id)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post.id)
    end

    assert_redirected_to post_url
  end
end
