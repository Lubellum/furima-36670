FactoryBot.define do
  factory :item do
    item_name               {  }
    explanation             {  }
    category_id             {  }
    condition_id            {  }
    delivery_fee_payment_id {  }
    ship_from_address_id    {  }
    ship_to_duration_id     {  }
    price

    after(:build) do |item|
      item.imgage.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
