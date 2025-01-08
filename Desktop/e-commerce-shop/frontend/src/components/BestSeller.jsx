import React, { useContext } from 'react'
import { ShopContext } from '../context/shopContext'
import { useEffect } from 'react';
import { useState } from 'react';   
import Title from './Title';
import ProductItem from './ProductItem';
const BestSeller = () => {

    const {products} = useContext(ShopContext);

    const [bestSeller, setBestSeller] = useState([]);

    useEffect(() => {
        const bestProduct = products.filter((item)=> (item.bestseller));
        setBestSeller(bestProduct.slice(0, 5));
    }, [])



   
  return (
    <div className='my-10'>
        <div className='text-center text-3xl py-8'>
            <Title text1={'BEST'} text2={'SELLERS'}/>
            
            <p className='w-3/4 m-auto text-xs sm:text-sm md:text-base text-gray-600'>
            Discover our top-rated products in the **Best Sellers** section! These items are loved by customers for their quality, performance, and value. From running shoes to fitness accessories and outdoor gear, our Best Sellers are perfect for athletes and enthusiasts who want the best.</p>
           
        </div>

        <div className='grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 gap-4 gap-y-6'>
           {
            bestSeller.map((item, index)=> (
                <ProductItem key={index} id={item._id} image={item.image} name={item.name} price={item.price}/>
            ))
           } 
        </div>


    </div>
  )
}

export default BestSeller


