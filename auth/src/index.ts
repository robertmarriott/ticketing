import { currentUserRouter } from './routes/current-user';
import express from 'express';
import morgan from 'morgan';
import { signInRouter } from './routes/signin';
import { signOutRouter } from './routes/signout';
import { signUpRouter } from './routes/signup';

const port = process.env.PORT ?? 3000;

const app = express();
app.use(morgan('common'));
app.use(express.json());

app.use(signUpRouter);
app.use(signInRouter);
app.use(signOutRouter);
app.use(currentUserRouter);

app.listen(port, () => console.log(`Listening on port ${port}`));
