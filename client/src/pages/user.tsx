import Header from '../components/header'
// import fetch from 'isomorphic-unfetch'
import fetch from 'node-fetch'

type Props = {
  props: {
    status: String,
    name: String,
    email: String,
    time: String,
  } 
  
}

const User = ( { props }: Props) => (
  <>
    <Header />
    <div>
      status: {props.status}
    </div>
    <div>
      user: {props.name} email: {props.email}
    </div>
    <div>
      time:{ props.time }
    </div>
  </>
)


User.getInitialProps = async () => {
  const url = "http://server:3000/api/users/1"

  const res = await fetch(url)
  const json = await res.json()
  const time = new Date().toString();



  return { props: {
    status: json.status,
    name: json.data.name,
    email: json.data.email,
    time: time
  }
 }
}

export default User