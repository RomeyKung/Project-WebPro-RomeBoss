<template>
  <div class="h-[97vh]">
    <div class="max-w-lg mx-auto my-8 p-6 rounded-lg shadow-lg bg-white ">
      <h1 class="text-3xl font-bold mb-4">Sign In</h1>
      <form class="max-w-md" @submit.prevent="signIn">
        <div class="mb-4">
          <label for="email" class="block text-gray-700 font-bold mb-2">Email:</label>
          <input type="email" id="email" v-model="email" required
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
        </div>
        <div class="mb-6">
          <label for="password" class="block text-gray-700 font-bold mb-2">Password:</label>
          <input type="password" id="password" v-model="password" required
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
        </div>
        <button type="submit"
          class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Sign
          In</button>
        <router-link to="/signup" class="ml-2 text-blue-600 hover:text-blue-800">Create an account</router-link>
      </form>
    </div>
  </div>
</template>

<script>
import axios from '/plugins/axios'

export default {
  data() {
    return {
      email: '',
      password: '',
    };
  },
  methods: {
    async signIn() {
      try {
        const data = {
          email: this.email,
          password: this.password
        };
        const res = await axios.post('/user/login/', data);
        const token = res.data.token;
        const user = res.data.user;
        this.$store.dispatch('setToken', { token, userInfo: user }); // เรียกใช้ action 'setToken' จาก Vuex store เพื่อกำหนดค่า token และ userInfo ใน state
        window.location.href = '/';
      } catch (error) {
        this.error = error.response.data;
        console.log(error.response.data);
      }
    },
  },
};
</script>

<style>
/* add your tailwind styles here */
</style>



