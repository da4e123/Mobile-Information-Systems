import React from 'react'
import Title from '../components/Title'
import assets from '../assets/assets'
import NewsletterBox from '../components/NewsletterBox'

const About = () => {
  return (
    <div>
      <div className='text-2xl text-center pt-8 border-t'>
        <Title text1={'ABOUT'} text2={'US'}/>
      </div>
 
      <div className='my-10 flex flex-col gap-6 text-gray-600 w-full min-h-screen justify-center items-center'>
    
        <div className='flex flex-col justify-center gap-6 md:w-2/4 text-gray-600 '>
            <p>Welcome to SportXtreme, your ultimate destination for premium sports gear and fitness essentials. At SportXtreme, we believe that a healthy lifestyle starts with the right equipment, and our mission is to empower athletes, fitness enthusiasts, and everyday adventurers to reach their full potential.

Founded with a passion for sports and wellness, we strive to bring you the best selection of high-quality products for every activity, from running and weightlifting to yoga and outdoor adventures. Whether you're a seasoned athlete or just starting your fitness journey, we’re here to support you every step of the way.</p>
            <b className='text-gray-800'>What sets us apart?</b>
            <li>Expertly Curated Products: We partner with top brands to offer a diverse range of gear and apparel that meets the highest standards of performance and durability.</li>
            <li>Fitness & Nutrition Tips: Through our platform, we go beyond shopping by providing expert advice to help you stay motivated, eat right, and train smarter.</li>
            <li>Customer-Centric Approach: Your goals are our priority. That’s why we’re committed to delivering outstanding service, fast delivery, and a seamless shopping experience.</li>
            <p>Join our growing community of sports lovers and discover the gear that keeps you going. At SportXtreme, it’s more than just sports – it’s a way of life!</p>
            <b className='text-gray-800'>Our Mission</b>
            <p>At SportXtreme, our mission is simple: to inspire and empower people to lead active, healthy lives. We aim to provide top-quality sports gear, expert advice, and exceptional service, helping athletes and fitness enthusiasts achieve their goals and push their limits every day.</p>
        </div>
      </div>

      <div className='text-xl py-4 flex justify-center items-center'>
        <Title text1={'WHY'} text2={'CHOOSE US'} />
      </div>

      <div className='flex flex-col md:flex-row text-sm mb-20'>
        <div className='border px-10 md:px-16 py-8 sm:py-20 flex flex-col gap-5'>
            <b>Quality Assurance:</b>
            <p className='text-gray-600'>At SportXtreme, quality is our top priority. We carefully select products from trusted brands to ensure every item meets the highest standards of performance and durability, giving you the confidence to excel in your fitness journey.</p>
        </div>
        <div className='border px-10 md:px-16 py-8 sm:py-20 flex flex-col gap-5'>
            <b>Convenience:</b>
            <p className='text-gray-600'>We’ve designed our platform with you in mind, offering a seamless shopping experience that’s fast, easy, and accessible. With just a few clicks, you can find everything you need to stay active and healthy, delivered straight to your doorstep.</p>
        
        </div>

        <div className='border px-10 md:px-16 py-8 sm:py-20 flex flex-col gap-5'>
            <b>Exceptional Customer Service:</b>
            <p className='text-gray-600'>Your satisfaction is at the heart of everything we do. Our dedicated support team is always ready to assist, whether you have a question, need help with an order, or want expert recommendations. At SportXtreme, we’re here for you every step of the way.</p>
        
        </div>

        
      </div>

      <NewsletterBox />
      
    </div>
  )
}

export default About
