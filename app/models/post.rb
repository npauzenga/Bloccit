class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :topic

  mount_uploader :post_image, PostImageUploader

  default_scope { order(created_at: :desc) }
  scope :ordered_by_title, -> { reorder(title: :asc) }
  scope :ordered_by_reverse_created_at, -> { reorder(created_at: :asc) }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  # validates :topic, presence: true
  # validates :user, presence: true

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)

  def markdown_title
    render_as_markdown(title)
  end

  def markdown_body
    render_as_markdown(body)
  end

  private

  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end
end
