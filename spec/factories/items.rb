FactoryBot.define do
  factory :item do
    image                   {  }
    item_name               {  }
    explanation             {  }
    category_id             {  }
    condition_id            {  }
    delivery_fee_payment_id {  }
    ship_from_address_id    {  }
    ship_to_duration_id     {  }
    price
  end
end
