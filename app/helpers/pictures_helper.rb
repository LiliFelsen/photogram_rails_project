module PicturesHelper

  def display_likes(picture)
    votes = picture.votes_for.up
    return list_likers(votes) if votes.size <= 5
    count_likers(votes)
  end

  def liked_picture(picture)
    return 'glyphicon-heart' if current_user.voted_for? picture
    'glyphicon-heart-empty'
  end

  private

  def list_likers(votes)
    usernames = []
    unless votes.blank?
      votes.voters.each do |voter|
        usernames.push(link_to voter.username, user_path(voter), class: 'user-name')
      end
      usernames.to_sentence.html_safe + like_plural(votes)
    end
  end

  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s + ' likes'
  end

  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end
end
