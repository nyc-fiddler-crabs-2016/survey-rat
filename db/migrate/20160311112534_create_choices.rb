class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :user, index: true
      t.references :possible_choice, index: true
      t.references :question, index: true

      t.timestamps null: false
    end
  end
end
