require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # fixtures/users.yml と fixtures/posts.yml のデータを使います
    @user = users(:one)
    @post = posts(:one)

    # ログイン必須の画面を見るために、Deviseの機能でログイン状態にする
    sign_in @user
  end
  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get show" do
    get posts_url(@post)
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should get create" do
    get posts_url
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should get update" do
    get posts_url(@post)
    assert_response :success
  end

  test "should get destroy" do
    get posts_url(@post)
    assert_response :success
  end
end
