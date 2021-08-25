require 'rails_helper'

describe 'the songs show page' do
  before(:each) do
    @artist = Artist.create!(name: 'Carly Bae Jepsen')
    @song_1 = @artist.songs.create!(
      title: "Hi Hello",
      length: 200,
      play_count: 999
    )
    @song_2 = @artist.songs.create!(
      title: "Call Me Never",
      length: 225,
      play_count: 45454545
    )
  end
  
  it 'displays song title' do
    visit "/songs/#{@song_1.id}"

    expect(page).to have_content(@song_1.title)
    expect(page).to_not have_content(@song_2.title)
  end

  it 'displays the artist' do
    visit "/songs/#{@song_1.id}"
    save_and_open_page

    expect(page).to have_content(@artist.name)
  end
end