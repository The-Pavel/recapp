class AddAttributesToEmployers < ActiveRecord::Migration[5.1]
  def change
    add_column :employers, :company_name, :string
    add_column :employers, :contact_info, :string
    add_column :employers, :image, :string
    add_column :employers, :employer_website, :string
    add_column :employers, :employer_bio, :string
    add_column :employers, :employer_title, :string
    add_column :employers, :first_name, :string
    add_column :employers, :last_name, :string
  end
end
