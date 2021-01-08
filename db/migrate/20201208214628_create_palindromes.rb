class CreatePalindromes < ActiveRecord::Migration[6.0]
  def change
    create_table :palindromes do |t|
      t.string :value
      t.string :res

      t.timestamps
    end
  end
end
