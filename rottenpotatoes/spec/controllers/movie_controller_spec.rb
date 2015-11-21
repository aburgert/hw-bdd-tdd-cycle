require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe 'find movies by same director when there is a director' do
        it 'should call the model method that searches by director' do
            fakemovie = {title: "Movie: The Movie", rating: "G", release_date: "1970-01-01", description: "Fake Description", director: "Firstname L'astname"}
            fakemovie2 = {title: "Movie: The Movie: The Sequel", release_date: "1971-01-01", description: "What?!", director: "Firstname L'astname"}
            Movie.create(fakemovie)
            Movie.create(fakemovie2)
            Movie.should_receive(:same_director).with(Movie.find_by_title("Movie: The Movie")).and_return(Movie.where(director: "Firstname L'astname"))
            get :director, {title: "Movie: The Movie"} #/movies/director?director="Firstname L'astname"
        end
        it 'should select the search results template for rendering'
        it 'should make the director search results available to that template'
    end
    
    describe 'find movies by same director when there is no director' do
        it 'should call the model method that searches by director'
        it 'should redirect to the homepage'
        it 'should display a flash??? edx isnt clear on what is supposed to happen here'
    end
end
