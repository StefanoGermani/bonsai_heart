# for more details see: http://emberjs.com/guides/models/defining-models/

BonsaiHeart.Bonsai = DS.Model.extend
  name: DS.attr 'string'


BonsaiHeart.Bonsai.FIXTURES = [
  {
    id: 1,
    name: 'Bonsai 1'
  },
  {
    id: 2,
    name: 'Bonsai 2'
  },
  {
    id: 3,
    name: 'Bonsai 3'
  }
];
