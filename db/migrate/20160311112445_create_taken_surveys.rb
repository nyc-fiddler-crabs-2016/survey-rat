class CreateTakenSurveys < ActiveRecord::Migration
  def change
    create_table :taken_surveys do |t|
      t.references :survey, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
