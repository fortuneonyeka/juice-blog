describe Article do
  let(:article_name) {Article.create("title", "body")}
  it "It has a title" do
    expects(article_name.title).to eq("title")
  end
end