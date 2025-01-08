import React from 'react'
import assets from '../assets/assets'

const Footer = () => {
  return (
    <div>
        <div className='flex flex-col sm:grid grid-cols-[4fr_1fr_1fr] gap-14 my-10 mt-40 text-sm'>
            <div>
            <img src={assets.logo} className='mb-5 w-32' alt="" />
            <p className='w-full md:w-2/3 text-gray-600'>
            © 2025 SportXtreme.mk. All Rights Reserved. Your one-stop shop for premium sports gear and fitness advice. Follow us on social media for updates, exclusive offers, and inspiration to keep you moving!
            </p>
        </div>
        <div>
            <p className='text-xl font-medium mb-5'>
                COMPANY
            </p>
            <ul className='flex flex-col gap-1 text-gray-600'>
                <li>Home</li>
                <li>About us</li>
                <li>Delivery</li>
                <li>Privacy policy</li>
            </ul>
        </div>

        <div>
            <p className='text-xl font-medium mb-5'>GET IN TOUCH</p>
            <ul className='flex flex-col gap-1 text-gray-600'>
                <li>+38975899453</li>
                <li>contact@sportXtreme.com</li>
            </ul>
        </div>
    </div>

    <div>
        <hr />
        <p className='py-5 text-sm text-center'>Copyright 2025@ sportXtreme.com - All Right Reserved</p>
    </div>
            
    </div>
  )
}

export default Footer
