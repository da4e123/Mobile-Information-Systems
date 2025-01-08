import React from 'react'
import { useContext } from 'react'
import { ShopContext } from '../context/shopContext'
import Title from './Title'
import ProductItem from './ProductItem'
import { useState } from 'react'
import { useEffect } from 'react'

const LatestCollection = () => {

    const {products} = useContext(ShopContext);
    const [latestProducts, setLatestProducts] = useState([]);

    useEffect(() => {
        setLatestProducts(products.slice(0,5));
    }, [])

    // console.log(products);

  return (
    <div className='my-10'>
      <div className='text-center py-8 text-3xl'>
        <Title text1={'LATEST'} text2={'COLLECTIONS'} />
        <p className='w-3/4 m-auto text-xs sm:text-sm md:text-base text-gray-600'>Stay ahead of the game with our newest arrivals! From cutting-edge fitness apparel to top-notch sports equipment, our latest collections are designed to help you perform your best and look great while doing it. Whether you're hitting the gym, the court, or the track, we've got you covered. Shop now and elevate your sports experience!</p>
      </div>

        {/*Rendering Products */}
        <div className='grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4 gap-y-6'>
            {
                latestProducts.map((item, index) =>(
                    <ProductItem key={index} id={item._id} image={item.image} name={item.name} price={item.price}/>
                ))
            }

        </div>
    </div>
  )
}

export default LatestCollection
