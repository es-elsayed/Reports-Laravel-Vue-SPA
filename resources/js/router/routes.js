import store from '../store/index.js'
function page (path) {
  return () =>
    import(/* webpackChunkName: '' */ `~/pages/${path}`).then(
      m => m.default || m
    )
}
export default [
  { path: '/', name: 'welcome', component: page('welcome.vue') },

  // start of my custom route
  { path: '/about', name: 'about', component: page('about') },
  {
    path: '/reports',
    name: 'reports',
    component: page('report/TheReports.vue')
  },
  {
    path: '/reports/list',
    name: 'reports.list',
    beforeEnter: (to, from, next) => {
      if (store.state.auth.role === 'admin') {
        return next()
      } else return next('/home')
    },
    component: page('report/ReportList.vue')
  },

  // end of my custom route
  { path: '/login', name: 'login', component: page('auth/login.vue') },
  { path: '/register', name: 'register', component: page('auth/register.vue') },
  {
    path: '/password/reset',
    name: 'password.request',
    component: page('auth/password/email.vue')
  },
  {
    path: '/password/reset/:token',
    name: 'password.reset',
    component: page('auth/password/reset.vue')
  },
  {
    path: '/email/verify/:id',
    name: 'verification.verify',
    component: page('auth/verification/verify.vue')
  },
  {
    path: '/email/resend',
    name: 'verification.resend',
    component: page('auth/verification/resend.vue')
  },

  { path: '/home', name: 'home', component: page('home.vue') },
  {
    path: '/settings',
    component: page('settings/index.vue'),
    children: [
      { path: '', redirect: { name: 'settings.profile' } },
      {
        path: 'profile',
        name: 'settings.profile',
        component: page('settings/profile.vue')
      },
      {
        path: 'password',
        name: 'settings.password',
        component: page('settings/password.vue')
      }
    ]
  },

  { path: '*', component: page('errors/404.vue') }
]
