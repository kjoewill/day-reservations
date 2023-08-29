require "test_helper"

class DayCommmentTest < ActionDispatch::IntegrationTest

    test 'Page has comment box' do
      get root_path 
      assert_select '.comment-box', count: 1
    end

    test "create a comment and verify its presence" do
      # 1. Generating a Comment
      comment = Comment.create!(day: Date.today, content: "My new comment")
      get root_path

      #Verify
      assert_select 'div.comment-box', "My new comment"
    end

    test "modify an existing comment and verify its update" do
        # 1. Create a comment
        comment = Comment.create!(day: Date.today, content: "Original comment content")
      
        # 2. Issue a PATCH request to update the comment
        patch comment_path(comment), params: { comment: { content: "Updated comment content" } }
      
        # 3. Reload the root page
        get root_path
      
        # 4. Verify the updated content
        assert_select 'div.comment-box', "Updated comment content"
      end



end
