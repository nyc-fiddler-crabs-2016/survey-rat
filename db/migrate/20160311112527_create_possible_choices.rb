class CreatePossibleChoices < ActiveRecord::Migration
  def change
    create_table :possible_choices do |t|
      t.string :option, null: false
      t.references :question, index: true

      t.timestamps null: false
    end
  end
end
