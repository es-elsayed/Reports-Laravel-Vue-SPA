function page (path) {
  return () =>
    import(/* webpackChunkName: '' */ `~/pages/${path}`).then(
      m => m.default || m
    )
}
export default [
  { path: '/', name: 'welcome', redirect: { name: 'login' } },

  // start of my custom route
  { path: '/users', name: 'user.tasks', component: page('User/All.vue') },
  { path: '/user/:id/tasks', name: 'user.id.tasks', component: page('User/All.vue') },

  {
    path: '/reports/add',
    name: 'reports.add',
    component: page('User/index.vue')
  },
  {
    path: '/reports',
    name: 'reports',
    component: page('Admin/index.vue'),
    children: [
      { path: '', redirect: { name: 'reports' } },
      {
        path: 'tasks',
        name: 'reports.tasks',
        component: page('Admin/Projects.vue')
      },
      {
        path: 'tasks/project/:id',
        name: 'reports.tasks.project',
        component: page('Admin/ProjectReports.vue')
      }
    ]
  },

  // end of my custom route
  { path: '/login', name: 'login', component: page('auth/login.vue') },
  // { path: '/register', name: 'register', component: page('auth/register.vue') },
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
