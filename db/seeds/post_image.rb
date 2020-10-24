PostImage.create!(
  [
    {
      id: 1,
      user_id: 1,
      image: File.open('./app/assets/images/post_image1.jpg'),
      caption: 'オレンジ'
    },

    {
      id: 2,
      user_id: 2,
      image: File.open('./app/assets/images/post_image2.jpg'),
      caption: 'みどり'
    }
  ]
)