import React from 'react'
import Link from 'next/link'

const Index = () => (
  <div>
    {/* aタグを<Link>コンポーネントで囲い、hrefなどのリンクの情報は<Link>に渡します。 */}
    <Link href="/about">
      <a style={{ fontSize: 20 }}>About Page</a>
    </Link>
    <p>Hello Next.js</p>
  </div>
)

export default Index