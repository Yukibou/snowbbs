class AddColumnMovieUrlToObservation < ActiveRecord::Migration[5.0]
  def change
    add_column :observations, :movie_url, :string
  end
end
