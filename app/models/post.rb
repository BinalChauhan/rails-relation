class Post < ApplicationRecord
  belongs_to :user
  belongs_to :company
  enum status: [
    :'published',
    :'uploaded'
  ]

  after_create :random_create , :status_value
  private
  def this_method
    puts "this is after thid_metod commit"
  end
    def random_create
      self.update(post_key: Random.hex(8))
      puts "hex value added"
    end
    def status_value
      self.update(status: 1)
      puts "this is value after create"
      # self.update(status: :published)
    end

end

